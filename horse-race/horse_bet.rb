#require_relative './horse_list'

horse_list = %w(Moe Larry Curly)

def horse_bet(horse_list, bet)
  winner = horse_list.sample
  winner == bet ? true : false
end
