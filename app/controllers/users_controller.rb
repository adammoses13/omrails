class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@routes = @user.routes.page(params[:page]).per_page(25)
  end
end
