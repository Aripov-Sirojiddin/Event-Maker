class UpdatePrivateForExistingTables < ActiveRecord::Migration[7.2]
  def up
    Event.update_all(private: false)
  end
end
