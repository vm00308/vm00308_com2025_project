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
    flash[:danger] = t('recipes_controller_texts.flash_destroy')
    redirect_to recipes_path
  end

  def update
    if(@recipe.update(recipe_params))
      flash[:primary] = t('recipes_controller_texts.flash_update')
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
      flash[:success] = t('recipes_controller_texts.flash_create')
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  private

  # Making sure that recipe name, description and any categories are permitted
  def recipe_params
    params.require(:recipe).permit(:name, :description, category_ids: [])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Restricting actions so only users who created an recipe can edit or destroy that recipe
  def require_same_user
    if current_user != @recipe.user and !current_user.admin?
      flash[:danger] = t('recipes_controller_texts.flash_require_same_user')
      redirect_to root_path
    end
  end

end