class ReviewsController < ApplicationController
  def show
    @review = Review.find(:id)
    authorize @review
  end

  def new
    # we need @restaurant in our `simple_form_for`
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new
    authorize @review
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)
    authorize @review
    @review.recipe = @recipe
    @review.user = current_user
    if @review.save
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    authorize @review
    redirect_to recipe_path(@review.recipe)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
