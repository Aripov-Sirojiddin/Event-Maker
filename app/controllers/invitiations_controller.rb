class InvitiationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @event = Event.find_by(id: params[:event_id])
    @invitation = Invitiation.new
  end
  def create
    event = Event.find_by(id: params[:event_id])
    user = User.find_by(username: params[:username])

    unless current_user == user || event.invited_users.include?(user)
      invitiation = Invitiation.new(user_id: user.id, event_id: params[:event_id]) unless user == current_user

      if invitiation.save
        redirect_to event, notice: "Succefully invited #{user.name}."
      end
    else
      redirect_to event, notice: "Failed to send invite."
    end
  end

  def destroy
    event = Event.find_by(id: params[:event_id])
    user = User.find_by(id: params[:user_id])
    if event.invited_users.include?(user)
      event.invited_users.destroy(user)
    end
    redirect_to event
  end

  def update_invite_status
    invite = Invitiation.find_by(id: params[:id])
    invite.update(status: params[:status])

    if params[:status] == "Accept"
      attendee = current_user.attendees.new(user_id: current_user.id, event_id: params[:event_id])
      if attendee.save
        redirect_to Event.find_by(id: params[:event_id])
      else
        redirect_to root_path
      end
    end
  end
end
