class AttendeesController < ApplicationController
  def create
    attendee = Attendee.new(user_id: current_user.id, event_id: params[:event_id])
    if attendee.save
      redirect_to Event.find_by(id: params[:event_id]), notice: "Succefully reserved a spot."
    else
      redirect_to root_path, notice: "Failed to reserve a spot."
    end
  end

  def destroy
    event = Event.find_by(id: params[:event_id])
    user = User.find_by(id: params[:user_id])

    if event.users.include?(user)
      event.users.destroy(user)
    end
    redirect_to event
  end
end
