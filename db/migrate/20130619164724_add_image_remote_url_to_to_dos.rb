class AddImageRemoteUrlToToDos < ActiveRecord::Migration
  def change
    add_column :to_dos, :image_remote_url, :string
  end
end
