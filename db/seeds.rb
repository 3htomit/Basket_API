puts 'Creating items:'

puts '   > item 1'
Item.create(price: 15, quantity: 2)

puts '   > item 2'
Item.create(price: 20, quantity: 1)

puts '   > item 3'
Item.create(price: 5, quantity: 4)

puts 'Done!'

puts
puts 'Here are the items:'
Item.all.each do |item|
  puts "#{item.id +1} at a price of #{item.price}€ and quantity of #{item.quantity}"
end
