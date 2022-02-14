# Day 1: Wish I Wasn't Here
```ruby
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
```

That's an actual code I've seen in a Rails controller while working. My time at the company was miserable since I couldn't justify refactoring it into something that didn't feel like an ontological challenge to the universe.

## What makes it *nonsense*?
Models should represent a particular object. It makes no sense to have the model `Wish` representing something that is NOT a wish.

On a more philosofical sense: what happens in a fraction of time is forever inscribed into eternity, it can't go back into a state of *not-being*.

Well, maybe a **wish** existed at some point and it doesn't anymore. Maybe it became something else. But we can still refer to that snapshot of its existence as a wish. It was a wish at that point, and when refered to at that point in time, it will forever be a wish.

So, we can still use the `Wish` model. And we can represent its transition via methods that express its *current* state, maybe as `#inactive?` maybe as `fulfilled?`, but, nonetheless, a wish.

## Why the *nonsense* happened?
Users could create a wishlist. Wishes could then be turned into orders. Wishes that became orders were reasoned in the code as not being wishes anymore, having become something else instead.

That created an issue for the model `Wish`. In that sense, the `Wish` class went from being a model representation of an object, into essentially working as both a model for wishes and a factory for things that may or may not be an actual wish.

## What would have prevented the *nonsense*?

If the factory logic was an operational `must-have`, then it should have been abstracted into another class that returns a `Wish` or an `Order` instance according to some given parameters.

Another, and probably better option, would have been rethinking the idea that *a wish can **become** an order* into something else: *a wish can **generate** an order*. This way we could use the `Wish` instances freely as snapshots and work the application code in such way that a wish becomes `#inactive?` when an `Order` is generated from it, and we could associate that wish  (`::has_one` or `::belongs_to`) to that order.