require_relative './chrstms_lst_2'

# [{name: "shoes" , status: true}]

gifts = [
  {name: "sockets" ,status: false},
  {name: "ruby book" ,status: false},
  {name: "macbook pro" ,status: false}
]

running = true

action_list = "[list|add|delete|mark|idea|quit]"
input = ""

puts "--------------------"
puts "Welcome to your Christmas giftlist"
puts "--------------------"

#### Get user action ####
while running
  puts "Which action #{action_list}?"
  input = gets.chomp
  case input
    when "list" then
      list(gifts)
    when "add" then
      puts "Which item to add to giftlist?"
      print ">"
      purchase = gets.chomp
      add(gifts, purchase)
      list(gifts)
    when "delete" then
      puts "Which item to delete from giftlist?"
      print ">"
      purchase = gets.chomp
      delete(gifts, purchase)
      list(gifts)
    when "mark" then
      puts "Which item to mark from giftlist?"
      print ">"
      purchase = gets.chomp
      mark(gifts, purchase)
      list(gifts)
    when "idea" then
      etsy_hash = {}
      puts "What are you searching on Etsy?"
      print ">"
      article = gets.chomp
      etsy_hash = idea(gifts, article)
      puts "Pick one to add to your list (give the number)"
      print ">"
      etsy_id = gets.chomp.to_i
      add(gifts, etsy_hash[etsy_id])
      list(gifts)
    when "quit" then
      puts "Goodbye"
      running = false
    else
      puts "Invalid input"
  end
end



