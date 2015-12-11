# This bug is nasty and difficult to spot.
#
# The variable "number" is defined within a block (the block that gets passed to "times")
# and falls out of scope by the last line of method_missing. When Ruby executes that line,
# it can’t know that the number there is supposed to be a variable. As a default, it
# assumes that number must be a parentheses-less method call on self.
#
# In normal circumstances, you would get an explicit NoMethodError that makes the problem
# obvious. But in this case you have a "method_missing", and that’s where the call to "number"
# ends. The same chain of events happens again—and again and again—until the call stack overflows.
#
# This is a common problem with Ghost Methods: because unknown calls become calls to
# "method_missing", your object might accept a call that’s just plain wrong. Finding a bug like
# this one in a large program can be pretty painful.
#
# To avoid this kind of trouble, take care not to introduce too many Ghost Methods. For example,
# Roulette might be better off if it simply accepted a few specific names. Also, remember to fall
# back on BasicObject#method_missing when you get a call you don’t know how to handle. Here’s a
# better Roulette that still uses "method_missing" (it contains new instructions at lines 24 and 25):

class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize
    super unless %w[Bob Frank Bill].include? person
    number = 0
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end

number_of = Roulette.new
puts number_of.bob
puts number_of.frank
