class UserMailer < ActionMailer::Base
  default from: "no-reply@climbon.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://immense-cliffs-8367.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Climb On!')
  end

  def reset_password_instructions(user)
    @user = user
    mail(to: @user.email, subject: 'Reset Password')
  end

end



#<p><%= link_to 'Change my password', edit_password_url(@resource, :reset_password_token => @resource.reset_password_token) %></p>
