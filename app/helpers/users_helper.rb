module UsersHelper
  def get_event_info(event_id)
    Event.find_by(id: event_id)
  end
end
