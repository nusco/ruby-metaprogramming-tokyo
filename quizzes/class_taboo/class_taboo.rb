# Did you ever play Taboo? The rules are simple: you’re given a secret
# word and a list of words that you cannot use. (They are “taboo.”)
# You must help a teammate guess the secret word. You can give your
# teammate as many suggestions as you want, but you must never say a
# taboo word. If you do that, you lose immediately.
# 
# Your challenge: play Taboo with Ruby code. You have only one taboo
# word, the *class* keyword. Your “secret word” is actually a Ruby
# class:

class MyClass < Array
  def my_method
    'Hello!'
  end
end

# Now try to rewrite the code above without using the class keyword.
# The test should still be green. In other words, you have to write
# a piece of code that has exactly the same effect as the one above,
# without ever using the class keyword. Are you up to the challenge?
#
# (Just one hint: look at the documentation for Class.new())

require 'test/unit'

class TestClassTaboo < Test::Unit::TestCase
  def test_a_MyClass_is_an_Array
    assert_same Array, MyClass.superclass
  end
  
  def test_a_MyClass_has_a_my_method
    obj = MyClass.new
    assert_equal 'Hello!', obj.my_method
  end
end
