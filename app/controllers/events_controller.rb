class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :authorize_user, only: [ :edit, :update, :destroy ]
  def index
    if params[:user_id]
      @events = Event.where(user_id: params[:user_id])
    else
      @events = Event.where(private: false)
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @attendees = @event.users
    @invitations = @event.invitiations
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

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    event = Event.find_by(id: params[:id])
    if event.update!(event_params)
      redirect_to event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find_by(id: params[:id])
    if event.present?
      event.destroy
    end
    redirect_to root_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :private)
  end

  def authorize_user
    event = Event.find_by(id: params[:id])

    if event.nil? || event.user_id != current_user.id
      flash[:notice] = "This event does not belong to you."
      redirect_to root_path
    end
  end
end
