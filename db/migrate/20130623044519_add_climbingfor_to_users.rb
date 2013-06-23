class AddClimbingforToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :climbingfor, :string
  end
end
