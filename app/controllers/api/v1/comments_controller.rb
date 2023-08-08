class Api::V1::CommentsController < ApplicationController
  skip_before_action :authenticate_request, only: [:index]
  before_action :set_user, only: [:create, :update, :destroy]
  # def product_comment
  #   @product = Product.find(params[:product_id])
  #   render json: @product.comments.all
  # end  

  def index
    comment = Comment.all
    render json: comment
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
    comment = @user.comment.find(params[:id])
    if comment.destroy
      render json: { notice: 'Comment is delete' }, status: :ok
    else
      render json: { notice: 'Comment can be deleted by owner of comment' }, status: :bad_request
    end
  end

  def update
    comment = @user.comment.find(params[:id])  # Use "comments" instead of "comment" for the association
      comment.user_id = @user.id
      if comment.update(comment_parms)
        render json: comment, notice: 'Comment is updated', status: :ok  # Use "comment" instead of "@user.comment"
      else
        render json: { error: comment.errors.full_messages }, status: :unprocessable_entity
      end
  end
  

  private

  def set_user
    @user = current_user
  end

  def comment_parms
    params.permit(:comment, :product_id)
  end
end
