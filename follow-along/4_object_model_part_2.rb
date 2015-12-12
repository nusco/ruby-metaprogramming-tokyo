# code in class definitions is just code

class MyClass
  puts 'Hello'
end

# class definitions return the last value

result = class MyClass
  self
end

result # => MyClass

# the "current class" (?)
# (skip for now)

# class_eval

def add_method_to(a_class)
  a_class.class_eval do
    def m; 'Hello!'; end
  end
end

add_method_to String
"abc".m   # => "Hello!"

# Class Instance Variables

class MyClass
  @my_var = 1
end

class MyClass
  @my_var = 1
  def self.read; @my_var; end
  def write; @my_var = 2; end
  def read; @my_var; end
end

obj = MyClass.new
obj.read            # => nil

obj.write
obj.read            # => 2
MyClass.read        # => 1

# class variables

class C
  @@v = 1
end

class D < C
  def my_method; @@v; end
end

D.new.my_method # => 1

# class variables: confusing

@@v = 1

class MyClass
  @@v = 2
end

@@v #=>2

# Quiz: class_taboo

# Singleton Methods

str = "just a regular string"

def str.title?
  self.upcase == self
end

str.title?                      # => false
str.methods.grep(/title?/)      # => [:title?]
str.singleton_methods           # => [:title?]

# the truth about class methods

an_object.a_method
AClass.a_class_method

def obj.a_singleton_method; end
def MyClass.another_class_method; end

# Class Macros

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

# [restart interpreter]

class MyClass
  attr_accessor :my_attribute
end

obj = MyClass.new
obj.my_attribute = 'x'
obj.my_attribute        # => "x"

# [turn this into a quiz]

class Book
  def title # ...
  end

  def subtitle # ...
  end
  
  def lend_to(user)
    puts "Lending to #{user}"
    # ...
  end

  def self.deprecate(old_method, new_method)
    define_method(old_method) do |*args, &block|
      warn "Warning: #{old_method}() is deprecated. Use #{new_method}()."
      send(new_method, *args, &block)
    end
  end
  
  deprecate :GetTitle, :title
  deprecate :LEND_TO_USER, :lend_to
  deprecate :title2, :subtitle
end

b = Book.new
b.LEND_TO_USER("Bill")

# capture warning
alias :old_warn :warn
$warnings = ""
def warn(s)
  $warnings << s
end

b.LEND_TO_USER("Bill")

# reset warnings
alias :warn :old_warn

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
singleton_class.class # => Class

"abc".singleton_class # => #<Class:#<String:0x331df0>>

# singleton classes are where singleton methods live

def obj.my_singleton_method; end
singleton_class.instance_methods.grep(/my_/) # => [:my_singleton_method]

# method lookup revisited

class C
  def a_method
    'C#a_method()'
  end
end

class D < C; end
obj = D.new
obj.a_method # => "C#a_method()"

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

C.singleton_class # => #<Class:C>
D.singleton_class # => #<Class:D>
D.singleton_class.superclass # => #<Class:C>
C.singleton_class.superclass # => #<Class:Object>

# why this complex arrangement?

D.a_class_method # => "C.a_class_method()"

# aliases

class MyClass
  def my_method; 'my_method()'; end
  alias_method :m, :my_method
end

obj = MyClass.new
obj.my_method # => "my_method()"
obj.m # => "my_method()"

# around aliases

class String
  alias_method :real_length, :length

  def length
    real_length > 5 ? 'long' : 'short'
  end
end

"Hi!".length # => "short"
"Hello, world!".length # => "long"

# Quiz: broken_math

# handout: object_model_2_swrap_up.txt
