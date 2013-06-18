class AddClimbedToToDos < ActiveRecord::Migration
  def change
  	add_column :to_dos, :climbed, :string
  end
end
