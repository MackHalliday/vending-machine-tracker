require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
  end

  describe 'relationship' do
    it {should have_many :machine_snacks}
    it {should have_many :machines}
  end

  describe 'methods' do
    it 'can find the average price of machine snack' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create!(location: "Don's Mixed Drinks")

      candy_bar = dons.snacks.create!(name: "Candy Bar", price: 1.50)
      chips = dons.snacks.create!(name: "Chips", price: 2.00)
      gum = dons.snacks.create!(name: "Gum", price: 0.50)
      pizza = dons.snacks.create!(name: "Pizza", price: 3.50)

      expect(dons.snacks.average_price).to eq(1.875)
    end
  end
end
