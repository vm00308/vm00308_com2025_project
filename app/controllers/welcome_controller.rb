class WelcomeController < ApplicationController

  def home
  end

  def about
  end

  def contact
  end

  def request_contact
    email = params[:email]
    message = params[:message]

    if email.blank?
      flash[:danger] = t('welcome_controller_texts.flash_blank_email')
      redirect_to contact_path
    elsif message.blank?
      flash[:danger] = t('welcome_controller_texts.flash_blank_message')
      redirect_to contact_path
    else
      ContactMailer.contact_email(email, message).deliver_now
      flash[:success] = t('welcome_controller_texts.flash_contact_success')
      redirect_to root_path
    end

  end

end