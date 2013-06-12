class AddGradeToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :Grade, :string
  end
end
