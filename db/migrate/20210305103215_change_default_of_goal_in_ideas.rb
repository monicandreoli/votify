class ChangeDefaultOfGoalInIdeas < ActiveRecord::Migration[6.0]
  def change
    change_column_default :ideas, :goal, 20
  end
end
