puts "Destroying all data"
UsersChoice.destroy_all
Basket.destroy_all
Item.destroy_all


puts 'Creating items:'

puts '   > item 1'
item1 = Item.create(price: 15, quantity: 2)

puts '   > item 2'
item2 = Item.create(price: 20, quantity: 1)

puts '   > item 3'
item3 = Item.create(price: 5, quantity: 4)


puts 'Creating basket:'
basket = Basket.create()

puts "Creating user's choices:"

puts '   > user choice 1'
UsersChoice.create!(basket:, item: item1)

puts '   > user choice 2'
UsersChoice.create!(basket:, item: item3)

# puts 'Done!'

# puts
# puts 'Here are the items:'
# Item.all.each do |item|
#   puts "#{item.id +1} at a price of #{item.price}€ and quantity of #{item.quantity}"

# end
