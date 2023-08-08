class Api::V1::CommentsController < ApplicationController
  skip_before_action :authenticate_request, only: [:product_comment]
  def product_comment
    @product = Product.find(params[:product_id]) # Use "params[:product_id]" instead of "params[:id]"
    render json: @product.comments.all # Assuming "comments" is the association name between products and comments
  end  

  def create
    @user = current_user
    comment = @user.comment.build(comment_parms)
    comment.user_id = @user.id
    if comment.save
      render json: comment, status: :created, notice: 'Comment is added'
    else
      render json: { error: comment.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    user = current_user
    comment = user.product.comment.find(params[:id])
    if comment.destroy
      render json: { notice: 'Comment is delete' }, status: :ok
    else
      render json: { notice: 'Comment can be deleted by owner of comment' }, status: :bad_request
    end
  end

  def update
    user = current_user
    product = Product.find(params[:id])
    comment = product.comment.update(comment_parms)
    comment.product_id = product.id
    if comment.update
      render json: comment, notice: 'Comment is update', status: :ok
    else
      render json: { error: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def comment_parms
    params.permit(:comment, :product_id)
  end
end
