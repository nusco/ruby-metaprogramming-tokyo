# The solution to this quiz is simple and subtle at the same time:
# include the module in the singleton class of MyClass, instead of
# including directly in MyClass.

module MyModule
  def my_method
    'hello'
  end
end

class MyClass
  class << self
    include MyModule
  end
end

MyClass.my_method # => "hello"

puts "OK!"

# Now my_method() is an instance method of the singleton class of 
# MyClass. As such, my_method() is also a class method of MyClass.
# Twisted, uhu?
