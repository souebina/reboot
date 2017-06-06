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
index = 0

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
      puts "Which item do you want to delete?(give the number)"
      print ">"
      index = gets.chomp.to_i - 1
      delete(gifts, index)
      list(gifts)
    when "mark" then
      puts "What did you buy?(give the number)"
      print ">"
      index = gets.chomp.to_i - 1
      mark(gifts, index)
      list(gifts)
    when "idea" then
      etsy_hash = {}
      puts "What are you searching on Etsy?"
      print ">"
      article = gets.chomp
      idea(gifts, article)
      list(gifts)
    when "quit" then
      puts "Goodbye"
      running = false
    else
      puts "Invalid input"
  end
end



