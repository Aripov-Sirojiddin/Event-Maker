module EventsHelper
  def get_event_creator(user_id)
    User.find_by(id: user_id).name
  end

  def render_event(event)
    content_tag :div, class: "event" do
      content_tag(:h3, event.title) +
      content_tag(:p, "Created by: #{get_event_creator(event.user_id)}") +
      content_tag(:p, event.description) +
      content_tag(:br)
    end
  end
end
