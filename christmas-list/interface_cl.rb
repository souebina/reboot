require_relative './chrstms_lst'

giftlist = {
          "sockets" => "",
          "ruby book" => "",
          "macbook pro" => ""
        }

action = ""

puts "--------------------"
puts "Welcome to your Christmas giftlist"
puts "--------------------"

#### Get user action ####
until action.downcase == "quit"
  puts "Which action [list|add|delete|mark|quit]?"
  action = gets.chomp
  case action
    when "list" then
      list(giftlist)
    when "add" then
      puts "Which item to add to giftlist?"
      print ">"
      purchase = gets.chomp
      add(giftlist, purchase)
    when "delete" then
      puts "Which item to delete from giftlist?"
      print ">"
      purchase = gets.chomp
      delete(giftlist, purchase)
    when "mark" then
      #puts "mark"
      puts "Which item to mark from giftlist?"
      print ">"
      purchase = gets.chomp
      mark(giftlist, purchase)
    when "quit" then
      puts "Goodbye"
    else
      puts "Wrong input."
  end
end


