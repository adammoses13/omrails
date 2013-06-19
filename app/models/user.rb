class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  before_save :create_permalink
  private
     def create_permalink
          self.permalink = name.downcase
     end

def to_param
  permalink
end
  
  has_many :routes, :dependent => :destroy
  has_many :to_dos, :dependent => :destroy
end
