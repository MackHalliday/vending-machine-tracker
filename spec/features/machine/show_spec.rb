require 'rails_helper'

RSpec.describe 'Vending machine show page', type: :feature do
  before :each do
    @owner = Owner.create(name: "Sam's Snacks")
    @dons  = @owner.machines.create!(location: "Don's Mixed Drinks")

    @candy_bar = @dons.snacks.create!(name: "Candy Bar", price: 1.50)
    @chips = @dons.snacks.create!(name: "Chips", price: 2.00)
    @gum = @dons.snacks.create!(name: "Gum", price: 0.50)
    @pizza = @dons.snacks.create!(name: "Pizza", price: 3.50)
  end

  scenario 'can see name and price of all snacks associated with machine' do
    visit (machine_path(@dons))

    expect(page).to have_content("#{@candy_bar.name}")
    expect(page).to have_content("#{@candy_bar.price}")
    expect(page).to have_content("#{@chips.name}")
    expect(page).to have_content("#{@candy_bar.price}")
    expect(page).to have_content("#{@gum.name}")
    expect(page).to have_content("#{@gum.price}")
    expect(page).to have_content("#{@pizza.name}")
    expect(page).to have_content("#{@pizza.name}")
  end

#   As a visitor
# When I visit a vending machine show page
# I also see an average price for all of the snacks in that machine
  it "can show the average price of snacks" do
    visit (machine_path(@dons))

    expect(page).to have_content("Average Price: 1.88")
  end
end
