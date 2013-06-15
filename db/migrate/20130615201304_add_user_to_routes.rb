class AddUserToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :user_id, :integer
    add_index :routes, :user_id
  end
end
