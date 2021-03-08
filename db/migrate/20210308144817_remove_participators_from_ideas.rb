class RemoveParticipatorsFromIdeas < ActiveRecord::Migration[6.0]
  def change
    remove_column :ideas, :participators
  end
end
