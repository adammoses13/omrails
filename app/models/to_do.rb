class ToDo < ActiveRecord::Base
  attr_accessible :description, :grade, :name, :image

	validates :user_id, presence: true
  validates :description, presence: true
  validates :grade, presence: true
  validates :name, presence: true
  validates_attachment :image, presence: true,
  							  						 content_type: {content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif' ]},
  														 size: { less_than: 5.megabytes}

  belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x150>" }
end