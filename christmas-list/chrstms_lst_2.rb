# scraping_etsy.rb
require "open-uri"
require "nokogiri"

def list(giftlist)
  giftlist.each_with_index do |gift, index|
    bought = gift[:status] ? "[x]" : "[ ]"
    puts "#{index + 1}. #{bought} #{gift[:name]}"
  end
end

def add(giftlist, purchase)
  if giftlist.has_key?(purchase)
      puts "You had already have #{purchase} on your list."
  else
      giftlist.store(purchase,"")
      puts "Added #{purchase} in your list."
  end
end

def delete(giftlist, purchase)
  if giftlist.has_key?(purchase)
      giftlist.delete(purchase)
      puts "Deleted #{purchase} from your list."
  else
      puts "#{purchase} is not on your list."
  end
end

def mark(giftlist, purchase)
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

puts "Here are Etsy results for #{article}:"
search_result.each{|id, title|
    puts "#{id}" + " - " + "#{title}"
}

return search_result
end
