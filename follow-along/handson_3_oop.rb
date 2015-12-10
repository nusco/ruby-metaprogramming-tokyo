# - classes and objects
# - inheritance
# - initialize()
# - instance variables
# - attributes

"abc".reverse # => "cba"
"abc".class   # => String
"abc".methods.sort # ...
1.class       # => Fixnum
Fixnum.instance_methods.sort # ...
1 + 2         # => 3
1.+(2)        # => 3

# classes and objects

class MyClass
  def an_instance_method
    "MyClass#an_instance_method()"
  end
end

obj = MyClass.new
obj.an_instance_method # => "MyClass#an_instance_method()"

# initialize() and instance variables

class MyClass
  def initialize(n)
    @x = n
  end
  
  def x=(n)
    @x = n
  end
  
  def x
    @x
  end
end

obj = MyClass.new(10)
obj.x         # => 10
obj.x=(11)
obj.x= 11
obj.x = 11
obj.x         # => 11

# attributes

class AnotherClass
  attr_accessor :an_attribute
end

# attr_reader and attr_writer

obj = AnotherClass.new
obj.methods.sort        # ...
obj.an_attribute = 11
obj.an_attribute        # => 11

# class methods

class AnotherClass
  def self.a_class_method
    "AnotherClass.a_class_method()"
  end
end

AnotherClass.a_class_method # => "AnotherClass.a_class_method()"

# inheritance

class MyString < String
  def hello
    "hello!"
  end
end

MyString.ancestors  # => [MyString, String, Comparable, Object, Kernel, BasicObject]
s = MyString.new("abc")
s.hello     # => "hello!"
s.reverse   # => "cba"

# super()

class MySubclass < MyClass
  def initialize(n)
    super n
    @y = 10
  end
  
  def y
    @y
  end
end

obj2 = MySubclass.new(12)
obj2.x         # => 12
obj2.y         # => 10

# self

class SomeClass
  def greetings
    "Hello! I am #{self}"
  end
end

obj = SomeClass.new # => #<SomeClass:0x007fef5c04cce0>
obj.greetings     # => "Hello! I am #<SomeClass:0x007fef5c04cce0>"

# anything else you want to know about classes and objects?
