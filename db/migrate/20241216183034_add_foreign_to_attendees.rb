class AddForeignToAttendees < ActiveRecord::Migration[7.2]
  def change
    add_column :attendees, :event_id, :integer
    add_column :attendees, :user_id, :integer
    add_foreign_key :attendees, :events
    add_foreign_key :attendees, :users
  end
end
