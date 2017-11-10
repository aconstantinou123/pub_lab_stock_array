require_relative("./customer.rb")
require_relative("./drink.rb")
require_relative("./food.rb")
require_relative("./pub.rb")
require_relative("./stock.rb")


  drinks = [
    {
      name: "Vodka",
      price: 4.50,
      alcohol: 40,
      stock: 5
    },
    {
      name: "Beer",
      price: 5.00,
      alcohol: 10,
      stock: 5
    },
    {
      name: "Wine",
      price: 7.50,
      alcohol: 15,
      stock: 0
    },
  ]

foods = [
    {
      name: "Crisps",
      price: 0.5,
      rejuv_level: 10,
      stock: 5
    },
    {
      name: "Steak",
      price: 20.00,
      rejuv_level: 30,
      stock: 5
    }

  ]


  pub = Pub.new("The King's Head", 0.0, [@drink1, @drink2, @drink3], [@food1, @food2, @food3])


puts "Hello. Welcome to the King's Head. Please tell me your name"
name = gets.chomp

puts "Please tell me your age"
age = gets.chomp.to_i

puts "Finally, please tell me how much money you have in your wallet. (A little rude I guesss but we can't have poor people in our pub)"
wallet = gets.chomp.to_f

customer = Customer.new(name, age, wallet, 0)

puts "Great. Thank you very much. Please type what you would like to buy"

until customer.drunkeness >= 50 || customer.wallet == 0

for drink in drinks
  puts "#{drink[:name]}          #{drink[:price]}"
end

drink = gets.chomp

"Excellent choice sir"
customer.buy_drink(pub, drinks, drink)

puts "You now have £#{customer.wallet.round(3)} remaining"

drunk_level = customer.drunkeness
  if drunk_level <= 20
    puts "Watch out you are getting drunk sir"
  elsif drunk_level >= 20
    puts "Sir you are getting very drunk. Please behave yourself"
  elsif drunk_level >= 30
    puts "Sir you are extremely drunk. You should eat something to rejuvinate your constitution"
  else
    puts "Sir please go home. You're making a fool of yourself"
  end

  puts "Would you like something to eat?"

  for food in foods
    puts "#{food[:name]}          #{food[:price]}"
  end

  food = gets.chomp

  "Excellent choice sir"
  customer.buy_food(pub, foods, food)
  puts "You now have £#{customer.wallet.round(3)} remaining"

end

puts "You are too drunk sir. Get out!"
