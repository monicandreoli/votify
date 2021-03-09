class ChangeStatusToIdeas < ActiveRecord::Migration[6.0]
  def change
    change_column_default :ideas, :status, "Pending"
  end
end
