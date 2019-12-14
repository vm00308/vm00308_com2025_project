class ApplicationController < ActionController::Base

  before_action :set_locale

  helper_method :current_user, :logged_in?

  # Finding logged in user by user id
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Checking if user is logged in
  def logged_in?
    !!current_user
  end

  # Requires users to perform actions
  def require_user
    if !logged_in?
      flash[:danger] = t('application_controller_texts.flash_logged_in')
      redirect_to root_path
    end
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale: I18n.locale}.merge options
  end

end