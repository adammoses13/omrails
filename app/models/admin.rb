class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # ,  and :omniauthable
  devise :database_authenticatable, :timeoutable, :lockable, :registerable,
         #:recoverable, 
         :rememberable, 
         :trackable
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
