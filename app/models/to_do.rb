class ToDo < ActiveRecord::Base
  attr_accessible :description, :grade, :name, :image, :climbed

  validates :climbed, presence: true
	validates :user_id, presence: true
  validates :description, presence: true
  validates :grade, presence: true
  validates :name, presence: true
  validates_attachment :image,
  							  						 content_type: {content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif' ]},
  														 size: { less_than: 5.megabytes}

  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x150>" }
end