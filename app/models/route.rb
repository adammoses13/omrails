class Route < ActiveRecord::Base
  
  attr_accessible :Name
  attr_accessible :date
  attr_accessible :Grade
  attr_accessible :description
  
  validates :Name, presence: true 
  validates :date, presence: true
	validates :Grade, presence: true
  validates :description, presence: true
end
