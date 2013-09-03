class Comment < ActiveRecord::Base
  attr_accessible :body, :commenter, :user_id


  belongs_to :route
  belongs_to :user

  after_create :send_email
	  def send_email
	  	UserMailer.comment_email(self.route).deliver
	  end

  
end
