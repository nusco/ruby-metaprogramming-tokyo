# Open Class / Monkeypatch

class String
  def shout
    upcase + "!"
  end
end

"hello".shout # => "HELLO!"

# class definitions are just code

3.times do
  class C
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

# [instance variables are in the object]

# where are methods?

obj.methods
obj.methods.grep(/my/) # => [:my_method]

# [methods are in the class]

# a diversion: "methods" vs. "instance methods"

MyClass.instance_methods == obj.methods # => true
MyClass.methods == obj.methods # => false

# classes are objects

obj.class # => MyClass
MyClass.class # => Class

Class.instance_methods(false) # => [:allocate, :new, :superclass]

Array.superclass # => Object
Object.superclass # => BasicObject
BasicObject.superclass # => nil

# class names are constants

MyOtherClass = MyClass
MyOtherClass.new

Array = MyClass
# [restart interpreter]

# modules

Class.superclass # => Module

# let's put it together

class MyClass; end
obj1 = MyClass.new
obj2 = MyClass.new
# [draw diagram while exploring]
obj1.class # => MyClass
obj2.class # => MyClass
MyClass.superclass # => Object
MyClass.class # => Class
Class.superclass # => Module

# Quiz: 1.missing_lines
# [distribute missing_lines.jpg handout]

# method lookup

# [restart interpreter]
class MyClass
  def my_method; 'my_method()'; end
end

class MySubclass < MyClass
end

obj = MySubclass.new
obj.my_method() # => "my_method()"

# [draw diagram]

obj.object_id
MySubclass.ancestors # => [MySubclass, MyClass, Object, Kernel, BasicObject]

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

# Kernel Method

module Kernel
  def greet
    'Hello!'
  end
end

"abc".greet # => "Hello!"
"abc".class.ancestors # => [String, Comparable, Object, Kernel, BasicObject]

# self

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
obj.testing_self # => #<MyClass:0x007f91d20eec58 @var=11>

# the top level

self # => main
self.class # => Object
self.greet # => "Hello!"

# class definitions and self

class MyClass
  self # => MyClass
end

# Quiz: 1.tangle_of_modules

# handout: object_model_1_wrap_up.txt