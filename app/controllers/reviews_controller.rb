class ReviewsController < ApplicationController
  before_action :find_review, only: [:show]

  def index
    @reviews = Review.all.page(params[:page]).per 5
  end
  def show; end

  private

  def find_review
    @review = Review.find_by id: params[:id]

    return if @review
    flash.now[:danger] = t "cant_find_review"
    redirect_to reviews_url
  end
end
