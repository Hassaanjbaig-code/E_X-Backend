class Api::V1::CartsController < ApplicationController
  def index
    render json: Cart.all
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
    @cart = Cart.new(cart_params)
    @cart.user_id = 1
    @cart.product_id = 1
    if @cart.save
      render json: @cart, status: :created, notice: 'Cart is created'
    else
      render json: { error: 'You have not seleted the product which you wnated to buy' }
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
  end

  private

  def cart_params
    params.permit(:quantity, :total_price)
  end
end
