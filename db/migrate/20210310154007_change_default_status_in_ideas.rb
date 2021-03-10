class ChangeDefaultStatusInIdeas < ActiveRecord::Migration[6.0]
  def change
    change_column_default :ideas, :status, nil
  end
end
