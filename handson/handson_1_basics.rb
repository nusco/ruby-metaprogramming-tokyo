# - basic types
# - variables and constants
# - “functions”
# - if and while
# - arrays and hashes

# I will be slow, so experiment
# Ask questions!

# start irb (or pry)

1 + 1 # => 2

# define variables

a = 1
b = 2
a + b # => 3

# first difference with Java/C#: no type declarations

# constants
S = "xyz" # !> previous definition of S was here
S = "xyzzy" # !> already initialized constant S

# hello, world
# how would you do it?
print "Hello, world!"
puts "Hello, world!"  # => nil

# (print() vs puts())
# ignore the "=> nil" part for now

# string quotes

born = 1969
Time.now
Time.now.year

puts "Happy #{Time.now.year - born}th birthday!"
puts 'Happy #{Time.now.year - born}th birthday!'

# strings are objects

"abc".reverse()
"abc".reverse

# functions

puts("Hello, world!")

def f()
  puts "Hello, world!"
end

f()   # => nil
f     # => nil

def greet(name) # !> previous definition of greet was here
  result =  "Hello, #{name}!"
  return result
end

greet("world")  # => "Hello, world!"

def greet(name) # !> previous definition of greet was here
  "Hello, #{name}!"
end

greet("world")  # => "Hello, world!"

# I'm so repetitive because we "learn from our hands"
# Note: I redefined an existing method!

# conditionals

def greet(name) # !> previous definition of greet was here
  if name.empty?
    "Hi, whoever you are!"
  else
    "Hello, #{name}!"
  end
end

greet "world"   # => "Hello, world!"
greet ""        # => "Hi, whoever you are!"

def greet(name) # !> method redefined; discarding old greet
  return "Hi, whoever you are!" if name.empty?
  "Hello, #{name}!"
end

greet ""  # => "Hi, whoever you are!"

# while

i = 1
puts (i = i * 2) while i < 100

# method names

s = greet "world"

s.empty?      # => false
s.empty?()    # => false

s.gsub(/wor.d/, "Mars") # => "Hello, Mars!"
s # => "Hello, world!"
s.gsub!(/wor.d/, "Mars") # => "Hello, Mars!"
s # => "Hello, Mars!"

# arrays
stuff = ["hello", "world"]
stuff.class # => Array
stuff.methods # ...
stuff << 42
stuff             # => ["hello", "world", 42]
stuff.pop         # => 42
stuff             # => ["hello", "world"]
stuff[1]          # => "world"
stuff.size        # => 2

# hashes (and symbols)
more_stuff = {"a" => "hello", "b" => "world"}
more_stuff.class  # => Hash
more_stuff.methods  # ...

more_stuff = {:a => "hello", :b => "world"}
more_stuff[:a]    # => "hello"

more_stuff = {a: "hello", b: "world"}
