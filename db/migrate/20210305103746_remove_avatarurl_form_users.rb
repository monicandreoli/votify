class RemoveAvatarurlFormUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :avatar_url, :string
  end
end
