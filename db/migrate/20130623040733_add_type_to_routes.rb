class AddTypeToRoutes < ActiveRecord::Migration
 	def change
    add_column :routes, :typeofclimb, :string
  end
end
