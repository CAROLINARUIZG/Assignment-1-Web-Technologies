class EventsController < ApplicationController
  def index
    @events = Event.includes(:category, :location, :organizer).order(start_date: :asc)
    @events = @events.where(category_id: params[:category_id]) if params[:category_id].present?
  end

  def show
    @event = Event.includes(:registrations, :reviews, :attendees, :organizer, :category, :location).find(params[:id])
  end
end
