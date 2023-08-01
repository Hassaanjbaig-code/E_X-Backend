class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: user, status: :created, notice: 'User is created'
      else
        render json: { error: 'User is not created' }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
