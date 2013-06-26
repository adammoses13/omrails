class Comment < ActiveRecord::Base
  belongs_to :route
  belongs_to :user
  attr_accessible :body, :commenter
end
