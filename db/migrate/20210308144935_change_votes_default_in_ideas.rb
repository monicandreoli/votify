class ChangeVotesDefaultInIdeas < ActiveRecord::Migration[6.0]
  def change
    change_column_default :ideas, :goal, 12
  end
end
