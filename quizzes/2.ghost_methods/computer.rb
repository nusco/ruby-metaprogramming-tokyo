# This system has three parts:
# - A "data source" (data_source.rb). Imagine that this file comes from a library,
#   and you cannot change it.
# - The Computer class below. It takes information from the data source, and
#   formats it for a screen-based report.
# - A unit test for the Computer class (computer_test.rb).
#
# Try running the test:
#
#  ruby computer_test.rb
#
# (If the line that requires 'test/unit' doesn't work on your system, then install
# the 'test-unit' gem with "gem install test-unit".
#
# OK, now for your task. The Computer class contains a lot of duplicated code. Can you
# remove this duplication by using method_missing()? You should only touch the Computer
# class - not the test, and not the data_source.rb file. At the end, the duplicated code
# should be gone, and the test should still be green.

class Computer < BasicObject
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(name, *args)
    super if !@data_source.respond_to?("get_#{name}_info")
    info = @data_source.send("get_#{name}_info", @id)
    price = @data_source.send("get_#{name}_price", @id)
    result = "#{name.capitalize}: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
end
