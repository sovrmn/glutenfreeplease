class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render 'new'
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :description)
  end
end

