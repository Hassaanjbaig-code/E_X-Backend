require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:all) do
    @user = User.create(name: 'test1', email: 'test1@yopmail.com', password: '1234')
    @product_attribute = {
      title: "Mens Casual Premium Slim Fit T-Shirts", 
      category: "men's clothing", 
      price: 12, 
      # image_url: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg", 
      desc: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
      user_id: @user
    }
  end

  it "It is valid" do
    @product = @user.product.build(@product_attribute)
    expect(@product).to be_valid
  end
  
  it "Checking the title" do
    @product = @user.product.build(@product_attribute)
    expect(@product.title).to eq("Mens Casual Premium Slim Fit T-Shirts")
  end
  
  it "Checking the price" do
    @product = @user.product.build(@product_attribute)
    expect(@product.price).to eq(12)
  end
  
end
