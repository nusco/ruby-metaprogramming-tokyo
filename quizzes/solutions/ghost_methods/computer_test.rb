# This is just the test for the Computer class. Don't modify this file!
# Read the exercise instructions in computer.rb.

require_relative 'computer'
require_relative 'data_source'
require 'test/unit'

class ComputerTest < Test::Unit::TestCase
  def setup
    @computer = Computer.new(60, DS.new)
  end
  
  def test_returns_a_printable_description
    assert_equal "Mouse: Wireless Touch ($60)", @computer.mouse
  end
  
  def test_marks_expensive_items_with_an_asterisk
    assert_equal "* Cpu: 2.9 Ghz quad-core ($120)", @computer.cpu
  end
end
