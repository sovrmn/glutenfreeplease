class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params.merge(user:current_user))
    if @ingredient.save
      redirect_to ingredients_path
    else
      render 'new'
      flash[:notice] = "The creation could not be completed."
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :description)
  end
end

