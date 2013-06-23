class AddLocationToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :location, :string
  end
end
