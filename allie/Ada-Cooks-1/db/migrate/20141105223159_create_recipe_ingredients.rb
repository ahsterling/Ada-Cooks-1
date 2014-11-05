class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.string :unit
      t.integer :measurement

      t.timestamps
    end
  end
end
