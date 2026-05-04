class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name)
  end

  def show
    @category = Category.find(params[:id])
    @events = @category.events.includes(:location, :organizer).order(start_date: :asc)
  end
end