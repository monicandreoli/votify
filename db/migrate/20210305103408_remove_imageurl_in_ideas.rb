class RemoveImageurlInIdeas < ActiveRecord::Migration[6.0]
  def change
    remove_column :ideas, :image_url, :string
  end
end
