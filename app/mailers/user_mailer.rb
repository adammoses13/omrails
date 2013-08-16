class UserMailer < ActionMailer::Base
  default from: "no-reply@climbon.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://immense-cliffs-8367.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Climb On!')
  end
end
