class AddVeganToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :vegan, :boolean
  end
end
