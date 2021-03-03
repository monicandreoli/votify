class AddCoordinatesToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :latitude, :float
    add_column :ideas, :longitude, :float
  end
end
