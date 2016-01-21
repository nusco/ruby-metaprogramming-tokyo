# Instead of putting attr_checked in the Class class (which makes it available
# to all classes), change it so that only selected classes have this Class Macro.
# In particular, a class must include a module named CheckedAttributes to gain
# access to the macro. Once again, look at the code in the Person class for an
# example.

# To make this work, you must know about Ruby's Hook Methods - in particular,
# the Module.included method. If you can solve this quiz, then you can call
# yourself a Ruby metaprogramming master!

module CheckedAttributes
  # Fill in the code here!
end

require 'test/unit'

class Person
  include CheckedAttributes

  attr_checked :age do |v|
    v >= 18
  end
end

class TestCheckedAttributes < Test::Unit::TestCase
  def setup
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 18
    assert_equal 18, @bob.age
  end

  def test_refuses_invalid_values
    assert_raises RuntimeError.new('Invalid attribute') do
      @bob.age = 17
    end
  end
end
