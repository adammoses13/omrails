class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :image_remote_url, :image, :password, :password_confirmation, :remember_me, :name, :hometown, :interests, :favclimb, :ability, :climbingfor, :reset_password_token, :reset_password_sent_at
  # attr_accessible :title, :body
  
  
  validates :email, presence: true
  validates :password, presence: true, :on => :create
  validates :password_confirmation, presence: true, :on => :create 
  validates :name, presence: true

  has_attached_file :image, :styles => { :large => "450x450>", :medium => "175x125>", :thumb => "70x50!" }
  validates_attachment :image, 
                               content_type: {content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif', 'image/JPG', 'image/JPEG' ]},
                               size: { less_than: 6.megabytes }


  has_many :routes, :dependent => :destroy
  has_many :to_dos, :dependent => :destroy
  has_many :comments

def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end


def send_password_reset
  generate_token(:reset_password_token)
  self.reset_password_sent_at = Time.zone.now
  save!
  UserMailer.reset_password_instructions(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.hex
  end while User.exists?(column => self[column])
end


end
