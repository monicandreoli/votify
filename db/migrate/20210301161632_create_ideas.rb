class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :problem
      t.text :solution
      t.string :address
      t.string :image_url
      t.integer :goal
      t.date :deadline
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
