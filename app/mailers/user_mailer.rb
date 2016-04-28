class UserMailer < ApplicationMailer
  default from: "mattcheang@yahoo.com"

  def new_user(user)
    @user = user
    headers["Message-ID"] = "<#{@user}@your-app-name.example>"

    mail(to: user.email, subject: "Welcome to Blocipedia")
   end
end
