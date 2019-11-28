class RecipesController < ApplicationController

  before_action :set_recipe, only: [:edit, :destroy, :update, :show]

  def index
    @all_recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def destroy
    @recipe.destroy
    flash[:danger] = "Recipe was successfully deleted!"
    redirect_to recipes_path
  end

  def update
    if(@recipe.update(recipe_params))
      flash[:primary] = "Recipe was successfully updated!"
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def show
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = User.first
    # @recipe.user = current_user
    if(@recipe.save)
      flash[:success] = "Recipe was successfully created!"
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  private 
  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end