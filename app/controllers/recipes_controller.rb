class RecipesController < ApplicationController

  before_action :set_recipe, only: [:edit, :destroy, :update, :show]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

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
    @recipe.user = current_user
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

  def require_same_user
    if current_user != @recipe.user
      flash[:danger] = "You can only edit or delete your own recipe!"
      redirect_to root_path
    end
  end

end