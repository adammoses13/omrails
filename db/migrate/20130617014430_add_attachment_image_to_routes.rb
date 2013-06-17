class AddAttachmentImageToRoutes < ActiveRecord::Migration
  def self.up
    change_table :routes do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :routes, :image
  end
end
