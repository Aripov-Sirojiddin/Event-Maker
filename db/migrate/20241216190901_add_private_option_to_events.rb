class AddPrivateOptionToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :private, :boolean
  end
end
