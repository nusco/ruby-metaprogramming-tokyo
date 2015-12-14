# Write a class named Buffer that passes this test:

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

# In practice, a Buffer should store pieces of code without executing them, and
# then execute all of them in order when you call Buffer#play.
# To solve this quiz, remember the & operator!
