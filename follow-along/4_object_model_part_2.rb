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
  def read; @v; end # !> instance variable @v not initialized
end

# [draw diagram]

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

@@v = 1 # !> class variable access from toplevel

class MyClass
  @@v = 2
end

@@v # => 2 # !> class variable access from toplevel

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
def warn(s) # !> previous definition of warn was here
  $warnings << s
end

b.LEND_TO_USER("Bill")

# reset warnings
alias :warn :old_warn # !> method redefined; discarding old warn

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
