class UserMailer < ActionMailer::Base
  default from: "no-reply@climbon.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://www.climbon515.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Climb On!')
  end

  def reset_password_instructions(user)
    @user = user
    mail(to: @user.email, subject: 'Reset Password')
  end

  def comment_email(route)
    @route = route
    mail(to: @route.user.email, subject: 'New Comment')
  end

end