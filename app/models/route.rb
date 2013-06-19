class Route < ActiveRecord::Base
  
  attr_accessible :Name
  attr_accessible :date
  attr_accessible :Grade
  attr_accessible :description
  attr_accessible :image
  attr_accessible :image_remote_url
  
  validates :user_id, presence: true
  validates :Name, presence: true 
  validates :date, presence: true
	validates :Grade, presence: true
  validates :description, presence: true
  validates_attachment :image, presence: true,
  														 content_type: {content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif' ]},
  														 size: { less_than: 5.megabytes }

  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end
end
