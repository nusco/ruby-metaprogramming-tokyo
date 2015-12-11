# To solve this quiz you need to know:
# - how Ruby blocks work;
# - how to raise and catch exceptions in Ruby.

# Python has a "with" statement that automatically frees a resource after you're
# done using it. For example, if you say:
#
#    with open("file.txt"):
#        # do stuff here
#
# then the program opens "file.txt", does the stuff and finally (automatically)
# closes the file. The file is always closed, even if the code in the body of
# the "with" raises an exception.
#
# This mechanism is useful when you want to work with a resource that needs
# to be disposed of, and you want to make sure that the resource is always closed,
# no matter what happens in the code. It's a useful feature, and many languages
# have something similar - including C# and Java. Ruby doesn't have this feature,
# but you can easily implement it yourself.
#
# To solve this quiz, you'll write a with() method in Ruby. This method takes a
# resource and the block. The resource can be any object, but it must have a
# method called dispose(). The with() method will execute the block, and then
# call dispose() on the resource. The good thing about with() is that it
# guarantees that dispose() is always called, even when the block raises an
# exception.


# Let's start by creating a Resource class to test our implementation of with().
# A Resource is just an object with a dispose() method:

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
    begin
      yield
    ensure
      disposable_resource.dispose
    end
  end
end
