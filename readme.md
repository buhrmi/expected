# Expected


## Expected is a small little helper to ease some pain commonly encountered during development.

A lot of times, especially when reading someone elses code, you come across code pieces that are just simply confusing. Sometimes you might not even know what a method is expected to do.

Take this example

class Person
  # Unclear comment
  def full_name
    return calculate_full_name
  end
end

In this example, the developer was very unclear about his intentions. If you were to inherit this code, you'd have no idea what the expected return value of the method full_name should be. The comment isn't helpful, so you have no other choice as to look up the definition of calculate_full_name to actually find out what this method is expected to do.

Enter the expected gem.

This gem adds a helper method, that you can use to always return what you expect it to return. Let's rewrite the example with the expected gem.

    class Person
      # This should return first_name + " " + last_name
      def full_name
        return expected
      end
    end

Let's see if it works.

    p = Person.new
    p.first_name = 'Mike'
    p.last_name = 'Bacon'
    p.full_name
    => "Mike Bacon"

Perfect! Now full_name returns exactly what we expect it to return, without any confusion going on. This is because the return value of expected is always the expected value. Hence the name. Finally a method that always returns what you expect it to return. Think about how this can simplify your developer life.

    # This method returns Math::PI
    def calculate_pi
      # some...
      # ... long and ...
      # .... diffuclt calculations.
    end

These calculations could be made so much easier by simply replacing them with what you expect the output of the method to be. So let's do that:

    # This method returns Math::PI
    def calculate_pi
      return expected
    end

    calculate_pi
    => 3.141592653589793

Nice.

Another short example. Let's say we have two variables m and p and for some reason we expect p to always be 1 greater then m. That's easy if you just assign expected to it. Because that's what you expect. And programming should not be confusing. Code should always to what you expect.

    m = 2
    p = expected # p is now expected to be m+1
    m
    => 3

Programming just became a lot easier.

But how can we test that this works? We can use unit tests to do that. But since expected always returns the value expected by assertions, the tests become very trivial. Here is an example test cases.

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

You'll see that these tests all pass (they are part of the actual test suite). This, again, is because expected always returns what we expect it to return. Even if we trick it into returning something that we don't expect to pass the assertion. But since we actually EXPECT to fail the assertion, the assertion passes because that's what we would have expected. Finally no confusion anymore!

Have fun with it! And if at any point expected does not return what you expect, that's because you have the wrong expectations.