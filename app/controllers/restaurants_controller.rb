class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
    @restaurant = Restaurant.new
  end

  def show

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
        redirect_to restaurant_path(@restaurant)
    else
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @restaurants.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:title, :content)
  end
end
