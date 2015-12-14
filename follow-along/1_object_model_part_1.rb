class C
  def x
    1
  end
end

obj = C.new
obj.x

# class definitions are just code

class C
  puts "hello"
end

3.times do
  class MyClass
    puts "hello"
  end
end

# same class, not different classes

class D
  def x; 'x'; end
end

class D
  def y; 'y'; end
end

obj = D.new
obj.x # => "x"
obj.y # => "y"

# Open Class / Monkeypatch

class String
  def shout
    upcase + "!"
  end
end

"hello".class # => String
"hello".shout # => "HELLO!"

# classes and objects example program

class MyClass
  def my_method
    @v = 1
  end
end

obj = MyClass.new
obj.class # => MyClass

# [whiteboard diagram: classes and objects]

# where are instance variables?

obj.instance_variables # => []
obj.my_method
obj.instance_variables # => [:@v]

# [diagram: instance variables are in the object]

obj.methods
obj.methods.grep(/my/) # => [:my_method]

# [diagram: methods are in the class]

# "methods" vs. "instance methods"

MyClass.instance_methods == obj.methods # => true
MyClass.methods == obj.methods # => false

# classes are objects

obj.class # => MyClass
MyClass.class # => Class

Class.instance_methods(false) # => [:allocate, :new, :superclass]
MyClass.new

# superclasses

MyClass.superclass # => Object
Array.superclass # => Object

# [add to diagram]

Object.superclass # => BasicObject
BasicObject.superclass # => nil

# class names are constants

X = 'hello'
Y = X
Y # => 'hello'

MyOtherClass = MyClass
MyOtherClass.new

Y = 10
Array = MyClass
Array = MyClass
# [restart interpreter]

# modules

Class.superclass # => Module
Class.instance_methods
Class.instance_methods - Module.instance_methods
Class.instance_methods(false) # => [:allocate, :new, :superclass]

# let's put it together

# [draw diagram while exploring]

class MyClass
  def my_method
    @v = 1
  end
end

obj1 = MyClass.new
obj2 = MyClass.new
obj1.my_method
obj1.class # => MyClass
obj2.class # => MyClass
MyClass.superclass # => Object
MyClass.class # => Class
Class.superclass # => Module

# Quiz: 1.missing_lines
# [distribute missing_lines.jpg handout]

# method lookup

# [maybe restart interpreter]

class MyClass
  def my_method
    @v = 1
  end
end

class MySubclass < MyClass
end

obj = MySubclass.new
obj.my_method() # => 1

# [draw or update diagram]

obj.__id__
MySubclass.ancestors # => [MySubclass, MyClass, Object, Kernel, BasicObject]

obj.method(:__id__)
obj.method(:__id__).owner # => BasicObject

# modules and lookup

module M1
  def my_method
    'M1#my_method()'
  end
end

class C1
  include M1
end

class D1 < C1; end

# [draw diagram]
D1.ancestors # => [D1, C1, M1, Object, Kernel, BasicObject]

# prepend

class C2
  prepend M1
end

class D2 < C2; end

D2.ancestors # => [D2, M1, C2, Object, Kernel, BasicObject]
# [draw diagram]

# self

# [restart interpreter]

class MyClass
  def testing_self
    @var = 10
    my_method
    self
  end
  
  def my_method
    @var = @var + 1
  end
end

obj = MyClass.new

# [draw diagram]

obj.testing_self # => #<MyClass:0x007f91d20eec58 @var=11>

# class definitions and self

class MyClass
  self # => MyClass
end

# the top level

self # => main
self.class # => Object

# Kernel Method

Object.ancestors # => [Object, Kernel, BasicObject]

module Kernel
  def greet
    'Hello!'
  end
end

"abc".greet # => "Hello!"
"abc".class.ancestors # => [String, Comparable, Object, Kernel, BasicObject]

self.greet # => "Hello!"
greet # => "Hello!"

# Quiz: 1.tangle_of_modules

# handout: object_model_1_wrap_up.txt