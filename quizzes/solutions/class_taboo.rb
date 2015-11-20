# Because a class is just an instance of Class, you can create it
# by calling Class.new. Class.new also accepts an argument (the 
# superclass of the new class) and a block that is evaluated in 
# the context of the newborn class:

c = Class.new(Array) do
  def my_method
    'Hello!'
  end
end

# Now you have a variable that references a class, but the class is
# still anonymous. The name of a class is just a constant, so you 
# can assign it yourself:

MyClass = c

# Interestingly, Ruby is cheating a little here. When you assign an 
# anonymous class to a constant, Ruby understands that you’re trying 
# to give a name to the class, and it does something special: it turns
# around to the class and says, “Here’s your new name.” Now the
# constant references the Class, and the Class also references the
# constant. If it weren’t for this trick, a class wouldn’t be able to
# know its own name, and you couldn’t write this:

c.name # => "MyClass"

# And here is the test - unchanged, and it still runs:

require 'test/unit'

class TestClassTaboo < Test::Unit::TestCase
  def test_a_MyClass_is_an_Array
    assert_same Array, MyClass.superclass
  end
  
  def test_a_MyClass_has_a_my_method
    obj = MyClass.new
    assert_equal 'Hello!', obj.my_method
  end
end
