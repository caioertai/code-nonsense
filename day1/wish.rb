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
