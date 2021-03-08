class AddMunicipalityToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :municipality, :boolean
  end
end
