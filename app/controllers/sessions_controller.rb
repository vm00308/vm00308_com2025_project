class SessionsController < ApplicationController

  # Sessions are how login and logouts are handled - login = create session; logout = destroy session

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = t('sessions_controller_texts.flash_create_success')
      redirect_to user_path(user)
    else
      flash.now[:danger] = t('sessions_controller_texts.flash_create_danger')
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = t('sessions_controller_texts.flash_destroy')
    redirect_to root_path
  end

end