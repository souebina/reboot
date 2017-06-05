
#1. Welcome
#2. create an array cosisiting of Horses in the Racd
# %w(Moe Larry Curly) * first
# horses = [] << Horses
#3. Collect a "Bet" from the user
#4. randomly pick a winning horse for each game (.shuffle / .last / .sample)
#5. Run a comparison between the user chose and which was randomly chosen
#6. Inform the user of whether or not he or she has won/lost


require_relative './horse_bet'
#require_relative './horse_list'

horse_list = %w(moe larry curly)

operation = ""
bet = ""

until bet.downcase == "exit"
  puts "Today's horses: #{horse_list}"
  puts "Bet?"
  print ">"
  bet  = gets.chomp.downcase

  #farewell = "You picked #{bet}, and the winner was XXXX"
  farewell = "You picked #{bet}, and the winner was XXXX"

  puts horse_bet(horse_list, bet) ? "You win!" + farewell : "You lose!" + farewell

end
