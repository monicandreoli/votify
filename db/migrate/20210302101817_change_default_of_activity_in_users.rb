class ChangeDefaultOfActivityInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :activity, 0
  end
end
