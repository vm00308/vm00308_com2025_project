class CategoriesController < ApplicationController

  before_action :set_category, only: [:edit, :destroy, :update, :show]
  before_action :require_admin_user, except: [:index, :show]

  def index
    @all_categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def destroy
    @category.destroy
    flash[:danger] = "Category was successfully deleted!"
    redirect_to categories_path
  end

  def update
    if(@category.update(category_params))
      flash[:primary] = "Category was successfully updated!"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def show
    @category_recipes = @category.recipes
  end

  def create
    @category = Category.new(category_params)
    if(@category.save)
      flash[:success] = "Category was successfully created!"
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
  
  def require_admin_user
    if !(logged_in? and current_user.admin?)
      flash[:danger] = "You must be an admin to perform that action!"
      redirect_to root_path
    end
  end



end