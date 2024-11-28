class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  def index
    if params[:user_id]
      @events = Event.where(user_id: params[:user_id])
    else
      @events = Event.all
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def create
    event = current_user.events.create(event_params)
    if event.save
      redirect_to event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :description)
  end
end
