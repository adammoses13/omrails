class AddNameToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :Name, :string
  end
end
