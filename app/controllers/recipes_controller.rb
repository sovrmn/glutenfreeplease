class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params.merge(user:current_user))
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
      flash[:notice] = "The creation could not be completed."
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
end
