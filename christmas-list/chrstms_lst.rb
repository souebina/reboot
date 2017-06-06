
def list(giftlist)
  counter = 1
  giftlist.each{|item, status|
    puts "#{counter}" + " - " + "[" + "#{status}" + "]" + " " + "#{item}"
    counter += 1
  }
  counter = 1
end

def add(giftlist, purchase)
  if giftlist.has_key?(purchase)
      puts "You had already have #{purchase} on your list."
      list(giftlist)
  else
      giftlist.store(purchase,"")
      puts "Added #{purchase} in your list."
      list(giftlist)
  end
end

def delete(giftlist, purchase)
  if giftlist.has_key?(purchase)
      giftlist.delete(purchase)
      puts "Deleted #{purchase} from your list."
      list(giftlist)
  else
      puts "#{purchase} is not on your list."
      list(giftlist)
  end
end

def mark(giftlist, purchase)
  if giftlist.has_key?(purchase)
    if giftlist[purchase] != "X"
      giftlist[purchase] = "X"
      puts "Marked #{purchase} as finished"
      list(giftlist)
    else
      puts "You had already checked #{purchase}."
      list(giftlist)
    end
  else
    puts "Created new list #{purchase} with Marked"
  end
end


=begin
    if giftlist[purchase] != "X"
      giftlist[purchase] = "X"
      puts "Added #{purchase} in your cart."
    else
      puts "You had already bought #{purchase}."
    end
  elsif purchase != "quit"
      puts "#{purchase} is not an available item.Pleaes enter another."
  else    #list(giftlist)
end
=end


=begin
  if items.has_key?(purchase)
    if cart.key?(purchase)
          cart[purchase] += items[purchase]
    else
          cart[purchase] = items[purchase]
    end
  elsif purchase != "q"
      puts "#{purchase} is not an available item.Pleaes enter another."
  else
      puts "Your total comes to #{checkout(cart)} JPY"
  end
end
=end
