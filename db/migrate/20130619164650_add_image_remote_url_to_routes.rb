class AddImageRemoteUrlToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :image_remote_url, :string
  end
end
