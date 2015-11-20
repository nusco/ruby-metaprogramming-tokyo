class MyClass; end

MyClass.singleton_class # => #<Class:MyClass>
String.singleton_class  # => #<Class:String>
"abc".singleton_class   # => #<Class:#<String:0x007fa29120dad8>>

class << MyClass
  self   # => #<Class:MyClass>
end

class << MyClass
  def a_class_method
    "OK!"
  end
end

MyClass.a_class_method  # => "OK!"
