class Page < ActiveRecord::Base
  attr_accessible :typeofclimb
  attr_accessible :location
  attr_accessible :Name
  attr_accessible :date
  attr_accessible :Grade
  attr_accessible :description
  attr_accessible :image
  attr_accessible :image_remote_url

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x150>" }

  def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end
end