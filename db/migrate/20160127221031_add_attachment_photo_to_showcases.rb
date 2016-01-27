class AddAttachmentPhotoToShowcases < ActiveRecord::Migration
  def self.up
    change_table :showcases do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :showcases, :photo
  end
end
