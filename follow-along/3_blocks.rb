# Quiz: 3.rubython

# blocks are closures

def my_method
  x = "Goodbye"
  yield("cruel")
end

x = "Hello"
my_method {|y| "#{x}, #{y} world" } # => 

# bindings inside the block disappear after the block

def just_yield
  yield
end

top_level_variable = 1

just_yield do
  top_level_variable += 1
  local_to_block = 1
end

top_level_variable # => 
local_to_block # => 

# scope gates

v1 = 1

class MyClass
  v2 = 2 # !> assigned but unused variable - v2
  local_variables # => 
  
  def my_method
    v3 = 3 # !> assigned but unused variable - v3
    local_variables # => 
  end
  
  local_variables # => 
end

obj = MyClass.new
obj.my_method
local_variables # => 
