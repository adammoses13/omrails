class AddTypeToToDos < ActiveRecord::Migration
  def change
  	add_column :to_dos, :typeofclimb, :string
  end
end
