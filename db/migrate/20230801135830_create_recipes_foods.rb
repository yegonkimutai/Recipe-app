class CreateRecipesFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes_foods do |t|
      t.integer :quantity
      t.references :food, foreign_key: true, null: false
      t.references :recipe, foreign_key: true, null: false

      t.timestamps
    end
  end
end
