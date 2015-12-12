# To solve this quiz you need to know:
# - how Ruby blocks work;
# - how to raise and catch exceptions in Ruby.

# Python has a "with" statement that automatically frees a resource after you finish using it. C# and Java have similar features. In this quiz, you'll be asked to create something similar for Ruby.

# Let's create a resource to test our implementation of with().
# A resource is just an object with a dispose() method:

class Resource
  def dispose
    @disposed = true
  end

  # This method is here to test that
  # a resource has been disposed of.
  def disposed?
    @disposed
  end
end

# Here are a few tests for the with() method:

require 'test/unit'

class TestWith < Test::Unit::TestCase

  # When I call with() and pass it a disposable object and a block,
  # then:
  # 1) the block is executed
  # 2) dispose() is called on the disposable object
  def test_disposes_of_resources
    x = 0
    disposable = Resource.new

    with(disposable) do
      x = 1
    end

    assert_equal 1, x
    assert disposable.disposed?
  end
  
  # Even if the block raises an exception, the resource
  # is still disposed of.
  def test_disposes_of_resources_in_case_of_exception
    disposable = Resource.new

    # The exception is still raised...
    assert_raises(Exception) {
      with(disposable) do
        raise Exception
      end
    }

    # ...and the resource is disposed of.
    assert disposable.disposed?
  end
end

# OK, it's finally time to write the with() method. Let's write it as
# a method of the Kernel module, so that we can call it from any place
# in our program. (If you don't know about Kernel, then just trust me
# for now: if you define a method in there, then this method will be
# accessible from anywhere).

module Kernel
  def with(disposable_resource)
    # TODO: this is your quiz. What do you write here?
  end
end
