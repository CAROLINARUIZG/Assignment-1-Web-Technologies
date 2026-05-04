class LocationsController < ApplicationController
  def index
    @locations = Location.order(:name)
  end

  def show
    @location = Location.find(params[:id])
    @events = @location.events.includes(:category, :organizer).order(start_date: :asc)
  end
end