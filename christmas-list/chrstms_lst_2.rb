# scraping_etsy.rb
require "open-uri"
require "nokogiri"

def list(gifts)
  gifts.each_with_index do |gift, index|
    bought = gift[:status] ? "[x]" : "[ ]"
    puts "#{index + 1}. #{bought} #{gift[:name]}"
  end
end

def add(gifts, purchase)
  gifts.each_with_index do |gift, index|
    if gift[:name].include?(purchase)
      gift = { name: new_present, status: false}
      gifts << gift unless gifts.include?(gift)
      puts "You had already have #{purchase} on your list."
    else
      gifts << { name: purchase, status: false}
      puts "Added #{purchase} in your list."
    end
  end
end


def delete(gifts, purchase)
  if gifts.has_key?(purchase)
      gifts.delete(purchase)
      puts "Deleted #{purchase} from your list."
  else
      puts "#{purchase} is not on your list."
  end
end

def mark(gifts, purchase)
  if giftlist.has_key?(purchase)
    if giftlist[purchase] != "X"
      giftlist[purchase] = "X"
      puts "Marked #{purchase} as finished"
    else
      puts "You had already checked #{purchase}."
    end
  else
    puts "Created new list #{purchase} with Marked"
  end
end

def idea(gifts, article)
search_result = {}

# 1. We get the HTML file thanks to open-uri
file = open("https://www.etsy.com/search?q=#{article}")

# 2. We build a Nokogiri document from this file
doc = Nokogiri::HTML(file)

# 3. We search every elements with class="card" in our HTML doc
doc.search(".card").each_with_index do |card, i|
  # 4. for each element found, we extract its title and print it
  title = card.search(".card-title").text.strip
  search_result.store(i + 1,title[0,50])
end

puts "Here are Etsy results for #{article}:"
search_result.each{|id, title|
    puts "#{id}" + " - " + "#{title}"
}

return search_result
end
