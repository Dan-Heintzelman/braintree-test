# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# 10.times do
#   Product.create()
# end

# Create some users

dan = User.create!(first_name: "Dan", last_name: "Heintzelman", password: "password", email: "dan@dan.com" )
izzy = User.create!(first_name: "Izzy", last_name: "Heintzelman", password: "password", email: "izzy@izzy.com" )
users = [dan, izzy]
# Create some products

p1 = Product.create!(name: "Organic Parakeet Freeze", description: "This icecream will make you so happy, you'll be squawking out random words for hours!", price: 1000)
p2 = Product.create!(name: "Ice Cream Soda", description: "Ice cream that tastes like cream soda. It's Soooda licious.", price: 1500)
p3 = Product.create!(name: "Blueberry Breeze", description: "Blueberry icecream, nuff' said.", price: 2000)
products = [p1,p2,p3]

10.times do
  Selecteditem.create!(user: users.sample, product: products.sample )
end
