class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :hometown, :interests, :favclimb, :ability, :climbingfor
  # attr_accessible :title, :body
  
  
  validates :email, presence: true
  validates :password, presence: true, :on => :new 
  validates :password_confirmation, presence: true, :on => :new 
  validates :name, presence: true
  
  


  has_many :routes, :dependent => :destroy
  has_many :to_dos, :dependent => :destroy
  has_many :comments


end
