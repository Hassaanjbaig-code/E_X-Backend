class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  before_action :set_user, only: [:show, :destroy]

  def index
    render json: User.all, status: :ok
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created, notice: 'User is created'
      else
        render json: { error: user.errors.full_messages }, status: :bad_request
    end
  end

  # def logged_in
  #   user = user.find(params[:email])
  # end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
