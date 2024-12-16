class AddForeignToAttendeesNullFalse < ActiveRecord::Migration[7.2]
  def change
    change_column_null :attendees, :event_id, false
    change_column_null :attendees, :user_id, false
  end
end
