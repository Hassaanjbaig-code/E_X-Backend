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
    if @cart.save
      render json: @cart, status: :created, notice: 'Cart is created'
    else
      render json: { error: 'You have not seleted the product which you wnated to buy' }
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
