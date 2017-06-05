
require_relative './horse_bet'
#require_relative './horse_list'

horse_list = %w(moe larry curly)

operation = ""
bet = ""
horses = []

until bet.downcase == "exit"
  puts "Provide 3 horses to bet on."
  for i in (1..3)
    horses << gets.chomp.downcase
  end

  puts "Now, type one horse's name to place on a bet on it."
  bet  = gets.chomp.downcase

  farewell = "You picked #{bet}, and the winner was XXX"

  puts horse_bet(horses, bet) ? "You win!" + farewell : "You lose!" + farewell

end
