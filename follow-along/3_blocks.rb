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

v1 = 1

class MyClass
  v2 = 2
  local_variables # => [:v2]

  def my_method
    v3 = 3
    local_variables # => [:v3]
  end

  local_variables # => [:v2]
end

obj = MyClass.new
obj.my_method
local_variables # => [:x, :top_level_variable, :v1, :obj, :v, :inc, :dec, :p, :my_proc]

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
  self        # => #<MyClass:0x007fdf4419c2f8 @v=1>
  @v          # => 1
end

v = 2
obj.instance_eval { @v = v }
obj.instance_eval { @v }      # => 2

# procs

# [restart interpreter]

inc = Proc.new {|x| x + 1 }
# more code...
inc.call(2) # => 3

# lambdas

dec = lambda {|x| x - 1 }
dec.class # => Proc
dec.call(2) # => 1

p = ->(x) { x + 1 }

# the & operator

# [restart interpreter]

def math(a, b)
  yield(a, b)
end

def do_math(a, b, &operation)
  math(a, b, &operation)
end

do_math(2, 3) {|x, y| x * y}  # => 6

def my_method(&the_proc)
  the_proc
end

p = my_method {|name| "Hello, #{name}!" }
p.class         # => Proc
p.call("Bill")  # => "Hello, Bill!"

def my_method(greeting)
  "#{greeting}, #{yield}!"
end

my_proc = proc { "Bill" }
my_method("Hello", &my_proc)

# Quiz: 4.recorder
