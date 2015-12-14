# Every single day, somewhere in the world, a Ruby programmer 
# tries to define a class method by including a module, like this:

module MyModule
  def my_method
    'my_method()'
  end
end

class MyClass
  include MyModule
end

MyClass.my_method # => NoMethodError!

puts "OK!"

# The code above breaks, because you only get instance methods by
# including a module - not class methods. How would you change the
# code above so that MyModule stays the same, but my_method becomes
# a class method on MyClass?
#
# (If you happen to know about the extend() method, try *not* to use
# it - it makes things so easy, you can call it cheating. :)
# Instead, think about the object model and singleton classes.)
#
# How would you modify the code above so that you can call
# MyClass.my_method() without getting an exception?
