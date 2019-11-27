class RecipesController < ApplicationController

  def index
    @all_recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if(@recipe.update(recipe_params))
      flash[:notice] = "Recipe was successfully updated"
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if(@recipe.save)
      flash[:notice] = "Recipe was successfully created"
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  private 
  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end

end