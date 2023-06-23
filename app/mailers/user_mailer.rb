class UserMailer < ApplicationMailer
  def forgot_username(user)
    @user = user
    mail(to: user.email, subject: "Forgot Username")
  end
end
