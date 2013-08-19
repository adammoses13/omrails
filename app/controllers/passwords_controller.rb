class PasswordsController < Devise::PasswordsController
 def update
    self.resource = resource_class.reset_password_by_token(resource_params)

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message(:notice, flash_message) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with resource, :location => after_resetting_password_path_for(resource)
    else
      respond_with resource
    end
  end

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
