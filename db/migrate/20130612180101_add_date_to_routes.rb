class AddDateToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :date, :string
  end
end
