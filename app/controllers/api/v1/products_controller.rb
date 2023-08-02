class Api::V1::ProductsController < ApplicationController
    skip_before_action :authenticate_request, only: [:index, :show ]
    before_action :set_user, only: [:create, :destroy, :myproduct]
    def index 
        product = Product.all.order(created_at: :desc)
        render json: product
    end

    def show
        product = Product.find(params[:id])
        if product
            render json: product
        else
            render json: { error: 'Product is not found' }, status: :bad_request
        end
    end

    def myproduct
        @user = current_user
        @product = @user.product.all
        render json: @product
    end

    def create
        @user = current_user
        @product = @user.product.build(tour_params)
        @product.user_id = @user.id
        if @product.save
            render json: @product, status: :created, notice: 'Product is created'
            else
                render json: { error: 'Product is not created' }, status: :bad_request
        end
    end

    def destroy
        @user = current_user
        product = @user.product.destroy
    end


    private

    def set_user
        @user = current_user
    end

    def tour_params
        params.permit(:title, :category, :price, :image_url, :quantity)
    end
end
