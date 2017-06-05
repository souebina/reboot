
require_relative './instacart'

items = {
          "bread" => 200,
          "chicken" => 300,
          "spinach" => 150,
          "fish" => 600
        }

purchase = ""
cart = {}

  puts "--------------------"
  puts "Welcome to Instacart"
  puts "--------------------"
  puts "In our store today:"

  items.each{|item, price|
     puts "#{item}" + " - " + "#{price} JPY"
  }

  until purchase == "q"
    puts "What do you want? Please enter names('q' to checkout)"
    print ">"
    purchase = gets.chomp
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

  #puts cart
  #puts "Your total amount is #{checkout(cart)}-JPY"
