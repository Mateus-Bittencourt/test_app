require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'its valid with description, price and category' do
    product = create(:product)
    expect(product).to be_valid
  end

  # it 'is invalid without description' do
  #   product = build(:product, description: nil)
  #   product.valid?
  #   expect(product).to be_invalid
  #   expect(product.errors[:description]).to include("can't be blank")
  # end

  # it 'is invalid without price' do
  #   product = build(:product, price: nil)
  #   product.valid?
  #   expect(product).to be_invalid
  #   expect(product.errors[:price]).to include("can't be blank")
  # end

  # it 'is invalid without category' do
  #   product = build(:product, category: nil)
  #   product.valid?
  #   expect(product).to be_invalid
  #   expect(product.errors[:category]).to include("can't be blank")
  # end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:category) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:category) }
  end

  context 'Instance Methods' do
    it '#full_description' do
      product = create(:product)
      expect(product.full_description).to eq("#{product.description} - #{product.price}\n  Category: #{product.category.description}")
    end
  end
end
