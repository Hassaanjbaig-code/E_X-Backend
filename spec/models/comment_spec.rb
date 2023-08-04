require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.create(name: 'test1', email: 'test1@yopmail.com', password: '1234')
    @product = @user.product.create(
      title: "Mens Casual Premium Slim Fit T-Shirts", 
      category: "men's clothing",
      price: 12, 
      desc: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
    )
    @comment_attributes = {
      comment: 'Very nice product',
      user_id: @user.id, 
      product_id: @product.id
    }
  end

  it 'Comment is valid' do
    comment = @product.comment.build(@comment_attributes)
    expect(comment).to be_valid
  end
  it 'Checking the comment is present' do
    comment = @product.comment.build(@comment_attributes)
    expect(comment.comment).to eq('Very nice product')
  end
  it 'Comment is not valid' do
    comment = @product.comment.build(@comment_attributes)
    comment.user_id = 0
    expect(comment).to_not be_valid
  end
end
