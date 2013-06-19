class UsersController < ActionController::Base
  def show
     @user = User.find_by_permalink(param[:id])
     @title = @user.name
end