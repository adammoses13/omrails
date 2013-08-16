class UsersController < ApplicationController
  before_filter :authenticate_user!

  # POST /users
  # POST /users.json

  def show
  	@user = User.find(params[:name])
  	@routes = @user.routes.page(params[:page]).per_page(25)
  end
end
