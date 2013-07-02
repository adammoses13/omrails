class Comment < ActiveRecord::Base
  attr_accessible :body, :commenter, :user_id


  belongs_to :route
  belongs_to :user
  
end
