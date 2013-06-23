class AddFavclimbToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :favclimb, :string
  end
end
