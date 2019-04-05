def ask(question)
  print question
  gets.chomp
end

#Discount for large orders
def price(quantity)
  if quantity >= 100
    price_per_unit = 8
  elsif quantity >= 50
    price_per_unit = 9
  else quantity < 50
    price_per_unit = 10
  end
  quantity * price_per_unit
end

#Display welcome message
puts "Welcome to the widget store."

#Ask for quantity
answer = ask("How many widgets do you require? ")

#Calculate total
number = answer.to_i
total = price(number)
p "For #{answer} widgets, your total is: £#{total}"