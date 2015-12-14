# a review of attr_accessor()

class MyClass
  attr_accessor :my_attribute
end

class MyClass
  def my_attribute=(value)
    @my_attribute = value
  end

  def my_attribute
    @my_attribute
  end
end

obj = MyClass.new
obj.my_attribute = 'x'
obj.my_attribute        # => "x"

# eval

array = [10, 20]
element = 30
eval("array << element") # => [10, 20, 30]

# Quiz: checked_attributes_1

# [explain why eval() is dangerous]

# Quiz: checked_attributes_2

# Quiz: checked_attributes_3

# Class Macros

class MyClass
  def attr1=(value)
    @attr1 = value
  end

  def attr1
    @attr1
  end
end

class MyClass
  attr_accessor :attr2
end

obj = MyClass.new
obj.attr2 = 'x'
obj.attr2        # => "x"

# defining a new Class Macro

def MyClass.my_macro(x)
  puts x
end

class MyClass
  my_macro 10
end

# Quiz: checked_attributes_4

# hook methods

class String
  def self.inherited(subclass)
    puts "#{self} was inherited by #{subclass}"
  end
end

class MyString < String; end

module M1
  def self.included(othermod)
    puts "M1 was included into #{othermod}"
  end
end

module M2
  def self.prepended(othermod)
    puts "M2 was prepended to #{othermod}"
  end
end

class C
  include M1
  prepend M2
end

module M
  def self.method_added(method)
    puts "New method: M##{method}"
  end

  def my_method; end
end

# Object#extend

module MyModule
  def my_method; 'hello'; end
end

obj = Object.new
obj.extend MyModule
obj.my_method       # => "hello"

class MyClass
  extend MyModule
end

MyClass.my_method   # => "hello"

# Quiz: checked_attributes_5


