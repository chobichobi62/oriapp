class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :user,          null: false, foreign_key: true
      t.string :title,             null: false
      t.text :material,          null: false
      t.text :make,                null: false
      t.string :recipe_image_id,   null: true
      t.integer :favorites_count, default: 0
      t.timestamps
    end
  end
end
