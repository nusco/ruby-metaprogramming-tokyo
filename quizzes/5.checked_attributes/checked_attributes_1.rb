# Your task is to write the string that is passed to eval():

def add_checked_attribute(klass, attribute)
  eval "..." # fill in this string of code!
end

# add_checked_attribute() should do a take a class and the name of an attribute, and
# generate a reader method and a writer method for the attribute on the class, pretty
# much like attr_accessor() does. However, add_checked_attribute() should also add
# basic validation to the attribute: the attribute will raise an exception if you
# assign it either nil or false. In other words, once you fill in the method, the
# following test should be green:

require 'test/unit'

class Person; end

class TestCheckedAttribute < Test::Unit::TestCase
  def setup
    add_checked_attribute(Person, :age)
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_refuses_nil_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = nil
    end
  end

  def test_refuses_false_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = false
    end
  end
end

# You shouldn't touch the test in this quiz. Just fill in the code in add_checked_attribute()
# until you make the test green. This is not an easy task, so ask questions to the teachers
# as soon as you feel that you are stuck!
