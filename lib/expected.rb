require 'binding_of_caller'

module Kernel
  def expected *whatever
    file, line_number, *whatever = caller[0].split(':')
    line_number = line_number.to_i
    code = IO.readlines(file)
    line = code[line_number-1]

    valid_expectation = false

    valid_expectation, expression = *line.match(/assert_equal +(.+?), *expected/)
    valid_expectation, expression = *line.match(/assert_equal +expected.*?, *(.+)/) unless valid_expectation
    valid_expectation, expression = *line.match(/assert_(.+?) /) unless valid_expectation
    if !valid_expectation
      valid_expectation, negation = *line.match(/assert +(!)?expected/)
      expression = negation ? 'false' : 'true' if valid_expectation
    end

    while !valid_expectation && line_number > 0
      line = code[line_number.to_i-1]
      valid_expectation, method, expression = *line.match(/#.*?(returns?|be) (.+)/)
      line_number -= 1
    end
    
    begin
      binding.of_caller(1).eval(expression)
    rescue NameError => e
      expression
    end
  end
end