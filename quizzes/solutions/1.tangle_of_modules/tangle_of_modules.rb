# The original code calls Printable#print(). To call Document#print()
# instead, just change the order of inclusions of the two modules in
# the Book class.

module Printable
  def print
    puts "Printable#print()"
  end
  
  def prepare_cover
    # there is code here, but we don't care about it
  end
end

module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
  end
  
  def format_for_screen
    # we don't care about this code either
  end
  
  def print
    puts "Document#print()"
  end
end

class Book
  include Printable
  include Document
  # ...  
end

b = Book.new
b.print_to_screen
