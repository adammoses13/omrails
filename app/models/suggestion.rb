class Suggestion

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :message

  validates :name, 
            :presence => true
  
  validates :email,
            :presence => true,
            :format => { :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
  
  validates :message,
            :presence => true,
            :length => { :minimum => 10, :maximum => 1000 }

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end


  def deliver
    return false unless valid?
    UserMailer.suggestion_email(self).deliver
    end

  def persisted?
    false
  end

end