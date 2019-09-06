# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
require 'rails_helper'

RSpec.describe 'Snack show page', type: :feature do
  before :each do

    @owner = Owner.create(name: "Sam's Snacks")
    @owner_2 = Owner.create(name: "Sam's Snacks")

    @dons  = @owner.machines.create!(location: "Don's Mixed Drinks")
    @downtown  = @owner_2.machines.create!(location: "Downtown")


    @candy_bar = Snack.create!(name: "Candy Bar", price: 1.50)
      @machine_snacks_1 = MachineSnack.create!(machine: @dons, snack: @candy_bar)
      @machine_snacks_2 = MachineSnack.create!(machine: @downtown, snack: @candy_bar)

    @chips = Snack.create!(name: "Chips", price: 2.00)
      @machine_snacks_3 = MachineSnack.create!(machine: @dons, snack: @chip)
      @machine_snacks_4 = MachineSnack.create!(machine: @downtown, snack: @chip)


  end
  it 'can show snack with price and locations' do

    visit snack_path(@candy_bar)

    expect(page).to have_content(@candy_bar.name)
    expect(page).to have_content(@candy_bar.price)
    expect(page).to have_content("Don's Mix Drink 2 kinds of snacks average price of $1.75")
    expect(page).to have_content("Downtown 2 kinds of snacks average price of $1.75")
  end
end
