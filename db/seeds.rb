# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do
 Item.create()

end

Item.create!(name: "Test Object", description: "This is a test object")

Item.create!(name: "Test Object 2", description: "This is the 2nd test object")

Item.create!(name: "Test Object 3", description: "This is the 3rd test object")
