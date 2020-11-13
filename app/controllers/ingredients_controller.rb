class IngredientsController < ApplicationController

  def index
    @ingredients = policy_scope(Ingredient).order(name: :asc)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
    authorize @ingredient
  end

  def create
    @ingredient = Ingredient.new(ingredient_params.merge(user:current_user))
    authorize @ingredient
    if @ingredient.save
      redirect_to ingredients_path
      flash[:notice] = "Ingredient was successfully created."
    else
      render 'new'
      flash[:notice] = "The creation could not be completed."
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    authorize @ingredient
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.user = current_user
    @ingredient.update(ingredient_params)
    authorize @ingredient
    if @ingredient.save
      redirect_to ingredients_path
    else
      render :new
      flash[:notice] = "The modification could not be completed."

    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    authorize @ingredient

    redirect_to ingredients_path
    flash[:notice] = "Ingredient was successfully deleted."
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :description)
  end
end
