class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]

  def index
    @all_users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = t('users_controller_texts.flash_destroy')
    redirect_to users_path
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
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private

  # Making sure that username, email and password are permitted
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  # Restricting actions so only users who created an account can edit that account
  def require_same_user
    if current_user != @user
      flash[:danger] = t('users_controller_texts.flash_require_same_user')
      redirect_to root_path
    end
  end
  
  # Restricting actions so only admin users can delete any users
  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = t('users_controller_texts.flash_require_admin')
      redirect_to root_path
    end
  end

end