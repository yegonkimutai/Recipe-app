class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :preparation
      t.string :cooking
      t.text :desc
      t.boolean :public
      t.references :user, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
