# Look at the code below. Don't run it yet.

class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end

# The idea of this class is that you can use it like this:

number_of = Roulette.new
puts number_of.bob
puts number_of.frank

# And the result is supposed to look like:
#
#   5...
#   6...
#   3...
#   Bob got a 3
#   7...
#   4...
#   10...
#   Frank got a 10
#
# Unfortunately, this small class contains a bug. Can you see it before
# you run the code?
#
# If you cannot see the bug, then try running the code. Can you explain
# what is happening? (Note: this is not easy to explain, so don't get
# frustrated!)
#
# Finally, how would you fix this bug?