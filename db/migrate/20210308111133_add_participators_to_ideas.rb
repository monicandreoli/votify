class AddParticipatorsToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :participators, :integer
  end
end
