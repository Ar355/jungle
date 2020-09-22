require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    before :each do
      @category = Category.new(:name => 'Lego')
      @product = Product.new(name: 'Mobile Bat', price: 200, quantity: 20, category: @category )
      
    end
    it 'saves successfully with all four fields set and belong to a category' do
      expect(@product).to be_valid
    end

    it 'expect error if name is nil' do
      # @category = Category.new(:name => 'Lego')
      # @product = Product.new(name: 'Mobile Bat', price: 200, quantity: 20, category: @category )
      @product.name = nil
      expect(@product).not_to be_valid
      puts @product.errors.full_messages
    end

    it 'expect error if price is nil' do
      # @category = Category.new(:name => 'Lego')
      # @product = Product.new(name: 'Mobile Bat', price: 200, quantity: 20, category: @category )
      @product.price_cents = nil
      expect(@product).not_to be_valid
      puts @product.errors.full_messages
    end

    it 'expect error if quatinty is nil' do
      # @category = Category.new(:name => 'Lego')
      # @product = Product.new(name: 'Mobile Bat', price: 200, quantity: 20, category: @category )
      @product.quantity = nil
      expect(@product).not_to be_valid
      puts @product.errors.full_messages
    end
    
    it 'expect error if category is nil' do
      # @category = Category.new(:name => 'Lego')
      # @product = Product.new(name: 'Mobile Bat', price: 200, quantity: 20, category: @category )
      @product.category = nil
      expect(@product).not_to be_valid
      puts @product.errors.full_messages
    end
    
  end

end