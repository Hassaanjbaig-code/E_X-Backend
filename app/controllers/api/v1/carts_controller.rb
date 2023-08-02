class Api::V1::CartsController < ApplicationController

  def index
    @user = current_user
    render json: @user.cart.all
  end

  def show
    @cart = Cart.find(params[:id])
    if @cart.length > 0
      render json: @cart
    else
      render :json, notice: { error: 'Select the pruduct for a cart' }
    end
  end

  def create
    @user =current_user
    @cart = Cart.new(cart_params)
    @cart.user_id = @user.id
    quantity = @cart.quantity
    product = Product.find_by(id: @cart.product_id)

    if quantity <= 0
      render json: { error: 'Quantity should be greater than zero' }, status: :bad_request
    elsif product.nil?
      render json: { error: 'Product not found' }, status: :bad_request
    elsif quantity > product.quantity
      render json: { error: 'Not enough products available in stock' }, status: :bad_request
    else
      # Subtract the cart's quantity from the product's quantity
      product.quantity -= quantity
  
      if product.save && @cart.save
        render json: @cart, status: :created, notice: 'Cart is added'
      else
        render json: { error: 'Could not create cart' }, status: :bad_request
      end
    end
  end

  def destroy
    @user = current_user
    @cart = @user.cart.find(params[:id])
    @cart.destroy
  end

  private

  def cart_params
    params.permit(:quantity, :total_price, :product_id)
  end

  def set_user
    @user = current_user
  end
end
