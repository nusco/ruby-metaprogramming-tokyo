# Three things in Ruby act as "Scope Gates": class definitions, module
# definitions and methods. One important skill for a Ruby programmer is
# carrying values across this gate. Look at this program:

my_var = "Success"

MyClass = Class.new do
  puts "#{my_var} in the class definition. You're half done!"

  define_method :my_method do
    puts "#{my_var} in the method. Congratulations, you made it!"
  end
end

MyClass.new.my_method

# If you try to run the program, it will fail, because "my_var" is not available
# either in the class definition or in the method. To make this work, you need to
# change the two lines with comments "you must change this line". You should have
# the exact same behavior (define a class, define a method), but without any Scope
# Gate.
