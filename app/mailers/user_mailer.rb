class UserMailer < ApplicationMailer
  default from: 'mattcheang@yahoo.com'

  def new_user(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Blocipedia")
   end
end
