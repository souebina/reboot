
def checkout(cart)
  total = ""

  cart.each_value do |cost|
    total += cost
  end

end

