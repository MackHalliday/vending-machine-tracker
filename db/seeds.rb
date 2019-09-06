# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
owner = Owner.create(name: "Sam's Snacks")
dons  = owner.machines.create!(location: "Don's Mixed Drinks")
downtown  = owner.machines.create!(location: "Downtown")


candy_bar = dons.snacks.create!(name: "Candy Bar", price: 1.50)
candy_bar = downtown.snacks.create!(name: "Candy Bar", price: 1.50)

chips = dons.snacks.create!(name: "Chips", price: 2.00)
chips = downtown.snacks.create!(name: "Chips", price: 1.00)

gum = downtown.snacks.create!(name: "Gum", price: 1.00)
