class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :find_comment, only: [:update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    review_id = if params[:comment_id]
                  params[:comment][:review_id]
                else
                  params[:review_id]
                end
    if !@commentable
      flash[:danger] = t "error_parrent_comment_not_found"
      redirect_to review_url(review_id)
    else
      @comment = @commentable.comments.new comment_params
      if @comment.save
        redirect_to review_url(review_id)
      else
        flash[:danger] = t "error_create_comment"
        redirect_to review_url(review_id)
      end
    end
  end

  def edit; end

  def update
    @comment.update_attributes body: params[:comment][:body]
  end

  def destroy
    return if @comment.destroy
    flash.now[:danger] = t "error_delete_comment"
  end

  private

  def comment_params
    params.require(:comment).permit :body, :user_id
  end

  def find_commentable
    @commentable = if params[:comment_id]
                     Comment.find_by id: params[:comment_id]
                   else
                     Review.find_by id: params[:review_id]
    end
  end

  def find_comment
    @comment = Comment.find_by id: params[:id]

    return if @comment
    flash.now[:danger] = t "error_comment_not_found"
    redirect_to reviews_url
  end

  def correct_user
    @comment = current_user.comments.find_by id: params[:id]
    redirect_to reviews_url unless @comment
  end
end
