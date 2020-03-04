class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @user = current_user
    @event = Event.new # needed to instantiate the form_for
  end

  def create
   @event = Event.new(event_params)
   @user = current_user
   @event.user = @user
    if @event.save!
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
      params.require(:event).permit(:title, :location, :description, :seats, :picture, :speakers, :date, :user_id)
    end

end
