class ToDo < ActiveRecord::Base
  attr_accessible :description, :grade, :name

  validates :description, presence: true
  validates :grade, presence: true
  validates :name, presence: true

end
