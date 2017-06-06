require_relative './chrstms_lst'

# [{name: "shoes" , status: true}]

giftlist = {
          "sockets" => "",
          "ruby book" => "",
          "macbook pro" => ""
        }

action_list = "[list|add|delete|mark|idea|quit]"
action = ""

puts "--------------------"
puts "Welcome to your Christmas giftlist"
puts "--------------------"

#### Get user action ####
until action.downcase == "quit"
  puts "Which action #{action_list}?"
  action = gets.chomp
  case action
    when "list" then
      list(giftlist)
    when "add" then
      puts "Which item to add to giftlist?"
      print ">"
      purchase = gets.chomp
      add(giftlist, purchase)
      list(giftlist)
    when "delete" then
      puts "Which item to delete from giftlist?"
      print ">"
      purchase = gets.chomp
      delete(giftlist, purchase)
      list(giftlist)
    when "mark" then
      puts "Which item to mark from giftlist?"
      print ">"
      purchase = gets.chomp
      mark(giftlist, purchase)
      list(giftlist)
    when "idea" then
      etsy_hash = {}
      puts "What are you searching on Etsy?"
      print ">"
      article = gets.chomp
      etsy_hash = idea(giftlist, article)
      puts "Pick one to add to your list (give the number)"
      print ">"
      etsy_id = gets.chomp.to_i
      add(giftlist, etsy_hash[etsy_id])
      list(giftlist)
    when "quit" then
      puts "Goodbye"
    else
      puts "Wrong input."
  end
end



