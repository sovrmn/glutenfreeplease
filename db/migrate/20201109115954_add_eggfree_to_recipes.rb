class AddEggfreeToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :eggfree, :boolean
  end
end
