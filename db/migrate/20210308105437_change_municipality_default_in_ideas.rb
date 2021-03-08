class ChangeMunicipalityDefaultInIdeas < ActiveRecord::Migration[6.0]
  def change
    change_column_default :ideas, :municipality, true
  end
end
