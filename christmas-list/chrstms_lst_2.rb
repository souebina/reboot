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
      gift = {}
      gift = { name: purchase, status: false}
      if gifts.include?(gift)
        puts "You had already have #{gift[:name]} on your list."
      else
        gifts << gift
        puts "Added #{gift[:name]} in your list."
      end
end

def delete(gifts, index)
  deleted = gifts.delete_at(index)
  puts "#{deleted[:name]} has been removed" if deleted
end

def mark(gifts, index)
  gift = gifts[index]
  gift[:status] = !gift[:status]
end

def idea(gifts, article)
  ideas = scrape_etsy(article) # => array of titles
  puts "how many elements do you want to see?"
  number = gets.chomp.to_i
  ideas[0,number].each_with_index do |idea, index|
    puts "#{index + 1}. #{idea}"
  end

  puts "Pick one to add it to your list [give the number]"
  index = gets.chomp.to_i - 1
    title = ideas[index]
    idea = {name: title, status: false}
    gifts << idea
end


def scrape_etsy(term)
  # 1. We get the HTML file thanks to open-uri
  file = open("https://www.etsy.com/search?q=#{term}")

  # 2. We build a Nokogiri document from this file
  doc = Nokogiri::HTML(file)

  # 3. We search every elements with class="card" in our HTML doc
  ideas = []
  doc.search(".card").each do |card|
    # 4. for each element found, we extract its title and print it
    title = card.search(".card-title").text.strip
    # puts title[0,40]
    ideas << title[0,50]
  end
  return ideas
end
