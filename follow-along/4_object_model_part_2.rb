# code in class definitions is just code

class MyClass
  puts 'Hello'
end

# class definitions return the last value

result = class MyClass
  42
end

result = class MyClass
  self
end

# the "current class" (?)
# (skip for now)

# class_eval

MyClass.class_eval do
  self
end

# Class Instance Variables

class MyClass
  @v = 1
end

# where is @my_var?

class MyClass
  def self.read; @v; end
  def write; @v = 2; end
  def read; @v; end
end

# [draw diagram]

obj = MyClass.new
obj.read            # => nil
obj.write
obj.read            # => 2
MyClass.read        # => 1

# (optional): class variables and why they are confusing

class C
  @@v = 1
end

class D < C
  def my_method; @@v; end
end

D.new.my_method # => 1

@@v = 1

class MyClass
  @@v = 2
end

@@v # => 2

# Quiz: 4.class_taboo

# Singleton Methods

str = "just a regular string"

def str.uppercase?
  self.upcase == self
end

str.uppercase?                  # => false
str.methods.grep(/upper/)       # => [:uppercase?]
str.singleton_methods           # => [:uppercase?]

# the truth about class methods

class C; end
obj = C.new

obj.object_id
C.name

def obj.a_singleton_method; end
def C.a_class_method; end

# [tell the truth about class methods :) ]
# [restart interpreter]

# Singleton Classes

class MyClass
  def my_method; end
end

obj = MyClass.new
obj.my_method

# [draw diagram]

def obj.my_singleton_method; end

def MyClass.my_class_method; end

# [where did they go?]

class << an_object
  # your code here
end

obj = Object.new
singleton_class = class << obj
  self
end
singleton_class.class # => 

"abc".singleton_class # => 

# singleton classes are where singleton methods live

def obj.my_singleton_method; end
singleton_class.instance_methods.grep(/my_/) # => 

# method lookup revisited

class C
  def a_method
    'C#a_method()'
  end
end

class D < C; end
obj = D.new
obj.a_method # => 

# [draw diagram]

class << obj
  def a_singleton_method
    'obj#a_singleton_method()'
  end
end

# [update diagram]

# advanced: singleton classes and inheritance

class C
  class << self
    def a_class_method
      'C.a_class_method()'
    end
  end
end

# [update diagram as you go]

C.singleton_class # => 
D.singleton_class # => 
D.singleton_class.superclass # => 
C.singleton_class.superclass # => 

# why this complex arrangement?

D.a_class_method # => 

# aliases

class MyClass
  def my_method; 'my_method()'; end
  alias_method :m, :my_method
end

obj = MyClass.new
obj.my_method # => 
obj.m # => 

# around aliases

class String
  alias_method :real_length, :length

  def length
    real_length > 5 ? 'long' : 'short'
  end
end

"Hi!".length # => 
"Hello, world!".length # => 

# Quiz: 4.broken_math

# handout: object_model_2_swrap_up.txt
# ~> -:187:in `<main>': undefined local variable or method `an_object' for main:Object (NameError)
# >> Hello
# >> Lending to Bill
# >> Lending to Bill
