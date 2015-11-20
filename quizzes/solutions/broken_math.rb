class Fixnum
  alias_method :old_plus, :+

  def +(value)
    self.old_plus(value).old_plus(1)
  end
end

# Now 1 + 1 == 3, and this code works without an exception:

raise "WRONG!" unless 1 + 1 == 3

# Don't try this at home!