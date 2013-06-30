class Route < ActiveRecord::Base
  
  #attr_accessible :title
  attr_accessible :typeofclimb
  attr_accessible :location
  attr_accessible :Name
  attr_accessible :date
  attr_accessible :Grade
  attr_accessible :description
  attr_accessible :image
  attr_accessible :image_remote_url
  
  #validates :title, presence: true, length: { minimum: 5 }
  validates :typeofclimb, presence: true
  validates :location, presence: true
  validates :user_id, presence: true
  validates :Name, presence: true 
  validates :date, presence: true
	validates :Grade, presence: true
  validates :description, presence: true
  validates_attachment :image, presence: true,
  														 content_type: {content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif', 'image/JPG', 'image/JPEG' ]},
  														 size: { less_than: 6.megabytes }

  belongs_to :user
  has_attached_file :image, :styles => { :large => "450x450>", :medium => "300x300>", :thumb => "100x100>" }
  has_many :comments, dependent: :destroy

  def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end
end
