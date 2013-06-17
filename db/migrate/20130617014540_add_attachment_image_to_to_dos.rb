class AddAttachmentImageToToDos < ActiveRecord::Migration
  def self.up
    change_table :to_dos do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :to_dos, :image
  end
end
