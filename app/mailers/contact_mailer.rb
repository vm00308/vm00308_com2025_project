class ContactMailer < ApplicationMailer

  # Assigning email and message parameters to variables
  def contact_email(email, message)
    @email = email
    @message = message

    mail cc: @email
  end

end
