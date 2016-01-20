# Extend add_checked_attribute() so that it takes a block, and uses the block to
# validate the attribute.

# As usual, ask questions if the goal isn't clear, or if you get stuck.

def add_checked_attribute(klass, attribute, &validation)
  # The code here is the solution to the previous quiz, but
  # it doesn't pass the updated version of the test. Modify it!
  klass.class_eval do
    define_method "#{attribute}=" do |value|
      raise 'Invalid attribute' unless value
      instance_variable_set("@#{attribute}", value)
    end

    define_method attribute do
      instance_variable_get "@#{attribute}"
    end
  end
end

require 'test/unit'

class Person; end

class TestCheckedAttribute < Test::Unit::TestCase
  def setup
    add_checked_attribute(Person, :age) {|v| v >= 18 }
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_refuses_invalid_values
    assert_raises RuntimeError.new('Invalid attribute') do
      @bob.age = 17
    end
  end
end
