# require_relative "compute_name"

def calculator

puts "Hello!"
puts "Please input 1st number"
print ">"
num1 = gets.chomp.to_i
puts "Please input 2nd number"
print ">"
num2 = gets.chomp.to_i

puts "Which operation [+][-][x][/]"
operator = gets.chomp

  while operator != ""
    case operator
    when "+" then
      result = num1 + num2
      puts "Answer is #{result}"
    when "-" then
      result = num1 - num2
      puts "Answer is #{result}"
    when "x" then
      result = num1 * num2
      puts "Answer is #{result}"
    when "/" then
      result = num1 % num2
      puts "Answer is #{result}"
    else
      puts "Wrong input!"
    end

    puts "Please input 1st number"
    print ">"
    num1 = gets.chomp.to_i
    puts "Please input 2nd number"
    print ">"
    num2 = gets.chomp.to_i

    puts "Which operation [+][-][x][/]"
    operator = gets.chomp
 end
end

calculator

