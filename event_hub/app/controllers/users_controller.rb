class UsersController < ApplicationController
  def index
    @users = User.order(:name)
  end

  def show
    @user = User.find(params[:id])
    @organized_events = @user.organized_events.includes(:category, :location)
    @registrations    = @user.registrations.includes(event: [:category, :location])
    @reviews          = @user.reviews.includes(:event)
  end
end