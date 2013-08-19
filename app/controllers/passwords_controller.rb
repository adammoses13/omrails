class PasswordsController < Devise::PasswordsController

 def edit
    self.resource = resource_class.new
    resource.reset_password_token = params[:reset_password_token]
 end

def create
  @user = User.find_by_email(params[:user][:email])
  if @user
    @user.send_password_reset
    flash[:notice] = "E-mail has been sent, please follow link in e-mail to reset password."
    redirect_to root_path
  else
    flash[:notice] = "Sorry, we couldn't find that email. Please try again."
    redirect_to root_path
  end
end







end
