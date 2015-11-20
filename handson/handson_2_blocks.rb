for i in 1..5
  puts i
end

# for loops are rarely ever used. instead...

# blocks
3.times { puts "hi" }
2.upto(4) {|i| puts "#{i}..." } # !> shadowing outer local variable - i
3.upto(5) do |i| # !> shadowing outer local variable - i
  puts "#{i}..."
end

stuff = ["hello", "world"]
stuff.each do |e|
  puts e.reverse
end

wrong_stuff = stuff.map do |e|
  e.gsub "o", "a"
end
wrong_stuff   # => ["hella", "warld"]

def decorate
  puts "in..."
  yield
  puts "...out"
end
decorate { puts "...block..." }

def callback # !> previous definition of callback was here
  yield 3
end
callback {|n| n * 2 }

def callback # !> method redefined; discarding old callback
  yield 3, 2
end
callback {|n, m| n * m }

def store_and_call(a, b, &c)
  callable_thing = c
  callable_thing.call(a, b)
end
store_and_call(1, 2) {|x, y| x + y } # => 3
