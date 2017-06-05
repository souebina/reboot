
def checkout(cart)
  total = 0

  cart.each_value do |cost|
    total += cost.to_i
  end

  return total
end

