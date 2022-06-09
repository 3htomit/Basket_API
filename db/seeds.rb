puts "\nSeeding database with 'db/seeds.rb'"
puts "\nDestroying all remaining data"
UsersChoice.destroy_all
Basket.destroy_all
Item.destroy_all


puts "\nCreating items:"

puts '   > item 1'
item1 = Item.create(price: 15, quantity: 2)

puts '   > item 2'
item2 = Item.create(price: 20, quantity: 1)

puts '   > item 3'
item3 = Item.create(price: 5, quantity: 4)


puts "\nInitializing baskets:"

puts '   > basket 1'
basket1 = Basket.new()

puts '   > basket 2'
basket2 = Basket.new(discount: 0.1, shipment: 7)


puts "\nCreating user's choices:"

puts '   > item 1 in basket 1'
UsersChoice.create!(basket: basket1, item: item1)

puts '   > item 2 in basket 1'
UsersChoice.create!(basket: basket1, item: item3)

puts '   > item 1 in basket 2'
UsersChoice.create!(basket: basket2, item: item1)

puts '   > item 2 in basket 2'
UsersChoice.create!(basket: basket2, item: item2)

puts '   > item 3 in basket 2'
UsersChoice.create!(basket: basket2, item: item3)


puts "\nSaving baskets:"

puts '   > basket 1'
basket1.save!

puts '   > basket 2'
basket2.save!


puts "\nDone!"
