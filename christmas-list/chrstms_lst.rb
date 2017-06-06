# scraping_etsy.rb
require "open-uri"
require "nokogiri"

def list(giftlist)
  counter = 1
  giftlist.each{|item, status|
    puts "#{counter}" + " - " + "[" + "#{status}" + "]" + " " + "#{item}"
    counter += 1
  }
  counter = 1
end

def add(giftlist, purchase)
  if giftlist.has_key?(purchase)
      puts "You had already have #{purchase} on your list."
      list(giftlist)
  else
      giftlist.store(purchase,"")
      puts "Added #{purchase} in your list."
      list(giftlist)
  end
end

def delete(giftlist, purchase)
  if giftlist.has_key?(purchase)
      giftlist.delete(purchase)
      puts "Deleted #{purchase} from your list."
      list(giftlist)
  else
      puts "#{purchase} is not on your list."
      list(giftlist)
  end
end

def mark(giftlist, purchase)
  if giftlist.has_key?(purchase)
    if giftlist[purchase] != "X"
      giftlist[purchase] = "X"
      puts "Marked #{purchase} as finished"
      list(giftlist)
    else
      puts "You had already checked #{purchase}."
      list(giftlist)
    end
  else
    puts "Created new list #{purchase} with Marked"
  end
end

def idea(giftlist, article)
search_result = {}

# 1. We get the HTML file thanks to open-uri
file = open("https://www.etsy.com/search?q=#{article}")

# 2. We build a Nokogiri document from this file
doc = Nokogiri::HTML(file)

# 3. We search every elements with class="card" in our HTML doc

doc.search(".card").each_with_index do |card, i|
  # 4. for each element found, we extract its title and print it
  title = card.search(".card-title").text.strip
  search_result.store(i + 1,title)
end

search_result.each{|id, title|
    puts "#{id}" + " - " + "#{title}"
}

return search_result
end

=begin
    if giftlist[purchase] != "X"
      giftlist[purchase] = "X"
      puts "Added #{purchase} in your cart."
    else
      puts "You had already bought #{purchase}."
    end
  elsif purchase != "quit"
      puts "#{purchase} is not an available item.Pleaes enter another."
  else    #list(giftlist)
end
=end


=begin
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
=end
