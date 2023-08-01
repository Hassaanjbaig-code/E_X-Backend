require 'rails_helper'

RSpec.describe Cart, type: :model do
  before(:all) do
    @user = User.create(name: 'test1', email: 'test1@yopmail.com', password: '1234')
    @product = @user.product.create(
      title: "Mens Casual Premium Slim Fit T-Shirts", 
      category: "men's clothing", 
      price: 12, 
      image_url: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"
    )
    @cart_attributes = {
      quantity: 3,
      total_price: 24,
      user_id: @user.id, 
      product_id: @product.id
    }
  end

  it 'Cart should be valid' do
    @cart = @user.cart.build(@cart_attributes) # Fix typo 'user' to '@user'
    expect(@cart).to be_valid
end

it 'Cart should be qunatity' do
    @cart = @user.cart.build(@cart_attributes) # Fix typo 'user' to '@user'
    expect(@cart.quantity).to eq(3)
  end
it 'Cart should be total price ' do
    @cart = @user.cart.build(@cart_attributes) # Fix typo 'user' to '@user'
    expect(@cart.total_price).to eq(24)
  end
end
