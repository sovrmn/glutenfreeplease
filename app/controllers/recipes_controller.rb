class RecipesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = " \
        recipes.name ILIKE :query \
        OR recipes.description ILIKE :query \
      "
      @recipes = policy_scope(Recipe).where(sql_query, query: "%#{params[:query]}%")
    else
      @recipes = policy_scope(Recipe)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @average = @recipe.reviews.map(&:rating).sum / @recipe.reviews.count.to_f
    authorize @recipe
  end

  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params.merge(user:current_user))
    @recipe.user = current_user
    authorize @recipe
    if @recipe.save
      redirect_to recipe_path(@recipe)
      flash[:notice] = "Recipe was successfully created."
    else
      render 'new'
      flash[:notice] = "The creation could not be completed."
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.user = current_user
    @recipe.update(recipe_params)
    authorize @recipe
    if @recipe.save
      redirect_to recipe_path(@recipe)
      flash[:notice] = "Recipe was successfully updated."
    else
      render :new
      flash[:notice] = "The modification could not be completed."

    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    authorize @recipe

    redirect_to recipes_path
    flash[:notice] = "Recipe was successfully deleted."
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :photo, :dairyfree, :eggfree, :vegan)
  end
end
