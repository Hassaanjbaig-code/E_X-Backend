class Api::V1::ProductsController < ApplicationController
    skip_before_action :authenticate_request, only: [:index, :show ]
    before_action :set_user, only: [:create, :destroy, :myproduct, :update]
    def index 
        product = Product.all.order(created_at: :desc)
        render json: product
    end

    def show
        product = Product.find(params[:id])
        product = product.as_json(include: :image).merge(
          image: product.image.map do |image|
            url_for(image)
          end
        )
      
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
        @product = @user.product.build(product_params.except(:image))
        @product.user_id = @user.id
      
        if @product.save
            images = Array(params[:image])
          if images
            images.each do |image|
              @product.image.attach(image) 
            end
          end
      
          render json: @product, status: :created, notice: 'Product is created'
        else
          render json: { error: 'Product is not created' }, status: :bad_request
        end
      end

      def update
        @user = current_user
        @product = @user.product.find(params[:id])
        @product.user_id = @user.id

        if @product.update(product_params)
          render json: @product , notice: 'Product is updated', status: :created
        else
          render json: { error: 'Something went wrong, Could not update the products '}, status: :bad_request 
        end
      end
      
      

    def destroy
        @user = current_user
        product = @user.product.find(params[:id])
        if product.destroy
          render json: { status: 'Deleted', notice: 'Product is deleted' }, status: :ok
        else
          render json: { error: product.errors.full_messages }, status: :unprocessable_entity
        end
    end


    private

    def set_user
        @user = current_user
    end

    def product_params
        params.permit(:title, :category, :price, :desc, :quantity, image: [])
    end
end
