module EventsHelper
  def get_user_by_id(user_id)
    User.find_by(id: user_id).name
  end

  def belongs_to_user?(event)
    !current_user.nil? && !event.nil? && event.user_id == current_user.id
  end

  def attending_event?(event)
    event.users.include?(current_user)
  end
end
