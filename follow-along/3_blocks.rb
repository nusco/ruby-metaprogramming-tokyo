# Quiz: 3.rubython

# blocks are closures

def my_method
  x = "Goodbye"
  yield("cruel")
end

x = "Hello"
my_method {|y| "#{x}, #{y} world" } # => "Hello, cruel world"

# bindings inside the block disappear after the block

def just_yield
  yield
end

top_level_variable = 1

just_yield do
  top_level_variable += 1
  local_to_block = 1
end

top_level_variable # => 2
# local_to_block is out of scope here

# [restart interpreter]

# scope gates

local_variables

v1 = 1

class MyClass
  v2 = 2
  p local_variables

  def my_method
    v3 = 3
    p local_variables
  end

  p local_variables
end

obj = MyClass.new
obj.my_method
local_variables # => [:obj, :v1, :top_level_variable, :x, :_]

# [explain the three scope gates: class definitions, module definitions, methods]

# Quiz: 3.scope_gates

# instance_eval

class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new

obj.instance_eval do
  p self
  p @v
end

v = 2
obj.instance_eval { @v = v }
obj.instance_eval { @v } # => 2

# procs

# [restart interpreter]

inc = Proc.new {|x| x + 1 }
inc.call(2) # => 3

# lambdas

dec = lambda {|x| x - 1 }
dec.class # => Proc
dec.call(2) # => 1

p = ->(x) { x + 1 }
p.call(2) # => 1

# the & operator

# [restart interpreter]

def my_method1(&the_proc)
  the_proc
end

p = my_method1 {|name| "Hello, #{name}!" }
p.class         # => Proc
p.call("Bill")  # => "Hello, Bill!"

def my_method2(greeting)
  "#{greeting}, #{yield}!"
end

my_proc = proc { "Bill" }
my_method2("Hello", &my_proc)

# Quiz: 3.buffer
