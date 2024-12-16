module EventsHelper
  def get_event_creator(user_id)
    User.find_by(id: user_id).name
  end

  def belongs_to_user?(event)
    !event.nil? && event.user_id == current_user.id
  end
end
