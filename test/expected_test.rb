require_relative '../lib/expected'
require 'test/unit'

class ExpectedTest < Test::Unit::TestCase
  def test_should_know_when_we_expect_nil
    assert_nil expected
  end

  def test_should_know_whats_expected
    assert_equal 'some dummy text', expected
  end

  # Or simply check if expected passes a simple assertion
  def test_passes_assertion
    assert expected
  end

  # But what if we expect NOT to get expected value?
  def test_expected_returns_not_whats_expected
    assert !expected
  end

   # in this case we have a simple variable and expect it to be 5
  def test_assigns_variables_to_expected_value
    a = expected
    assert_equal a + 1, 6
  end

  # it should be able to know what we expect in complicated situations
  def test_knows_what_we_expect_in_complicated_situation
    # first test
    a = expected   # for example, could return 1
    b = 2          # bigger than a
    assert a < b

    # to pass the next assertion we expect a to be 3
    # the comparison is switched around
    a = expected
    b = 2
    assert a > b
  end
end