lass AddUserToToDos < ActiveRecord::Migration
  def change
    add_column :dos, :user_id, :integer
    add_index :dos, :user_id
  end
end
