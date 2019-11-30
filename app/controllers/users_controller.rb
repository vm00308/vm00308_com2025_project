class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @all_users = User.all
  end

  def new
    @user = User.new
  end

  def edit

  end

  def destroy

  end

  def update
    if (@user.update(user_params))
      flash[:success] = "Your account was updated successfully: #{@user.username}!"
      redirect_to recipes_path
    else
      render 'edit'
    end
  end

  def show

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the RecipeList #{@user.username}"
      redirect_to recipes_path
      #redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit or delete your own account!"
      redirect_to root_path
    end
  end

end