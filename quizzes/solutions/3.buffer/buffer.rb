class Buffer
  def initialize
    @actions = []
  end

  def insert(&action)
    @actions << action
  end

  def play
    @actions.each do |action|
      action.call
    end
  end
end

require 'test/unit'

class BufferTest < Test::Unit::TestCase
  def test_buffers_and_plays_actions
    buffer = Buffer.new

    result = 2

    buffer.insert do
      result += 1
    end

    buffer.insert do
      result *= 2
    end

    buffer.insert do
      result += 1
    end

    assert_equal 2, result

    buffer.play

    assert_equal 7, result
  end
end
