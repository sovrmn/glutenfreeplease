class AddDairyfreeToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :dairyfree, :boolean
  end
end
