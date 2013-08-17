class PasswordsController < Devise::PasswordsController


	def create
		@user = User.find_by_email(params[:user][:email])
 		
 		if @user
      UserMailer.reset_password_instructions(@user).deliver
      format.html { redirect_to(root_path, notice: 'E-mail has been sent, please follow link in e-mail to reset password.') }          
 		end
	end

end
#self.resource = resource_class.send_reset_password_instructions(resource_params)
#
  #          if successfully_sent?(resource)
  #          flash[:notice] = "sent password"
  #          else
  #            respond_with(resource)
  #          end
  #      end



#@user = User.find_by_email(params[:user][:email])
#  respond_to do |format|
#  UserMailer.reset_password_instructions(@user).deliver
#        format.html { redirect_to(root_path, notice: 'User was successfully created.') }
#        format.json { render json: @user, status: :created, location: @user }
# end
