class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  def index
    @reviews = Review.new
    @review = Review.new
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :index
    end
    redirect_to restaurant_path(@restaurant)
  end

  def edit
  end

  def update
  end

  def destroy
    @reviews.destroy
    redirect_to restaurants_path
  end

  private

  def set_review
    @review = review.Restaurant.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
