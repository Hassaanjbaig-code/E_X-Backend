class Api::V1::ProductsController < ApplicationController
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

    def create
        @product = Product.new(product_parms)
        @product.user_id = 1
        if @product.save
            render json: @product, status: :created, notice: 'Product is created'
        end
        render json: { error: 'Product is not created' }, status: :bad_request
    end

    def create
        # @user = current_user
        @tour = Product.new(tour_params)
        p tour_params
        @tour.user_id = 1
        if @tour.save
          render json: @tour, status: :created, notice: 'Tour created successfully'
        else
          render json: { error: 'Could not create Tour' }, status: :bad_request
        end
      end


    private

    def tour_params
        params.permit(:title, :category, :price, :image_url)
    end
end
