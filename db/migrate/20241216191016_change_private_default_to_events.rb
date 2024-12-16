class ChangePrivateDefaultToEvents < ActiveRecord::Migration[7.2]
  def change
    change_column_default :events, :private, false
  end
end
