class DosesController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @dose = Dose.new
    authorize @dose
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @dose = Dose.new(dose_params.merge(user:current_user))
    authorize @dose
    @dose.recipe = @recipe

    if @dose.save
      redirect_to recipe_path(@recipe)
    else
      @dose= Dose.new
      flash[:notice] = "The creation could not be completed."
      render "recipes/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to recipe_path(@dose.recipe)
    authorize @dose
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
