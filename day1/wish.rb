# My time working in the company that had this in the system was miserable
# because I couldn't justify refactoring it into something that didn't feel
# like an ontological challenge to the universe.

class Wish
  def wish?
    rand(0..1).zero?
  end
end

wish = Wish.new

if wish.wish?
  puts "do_wish_stuff"
else
  puts "do_non_wish_stuff"
end

# The Wish class essentially worked as factory for things that may or may not
# be, abstractly speaking, an actual wish (in the actual case, an order). That
# means that the factory logic should have been abstracted into another class
# that returns a Wish or an Order instance according to the given parameters.
