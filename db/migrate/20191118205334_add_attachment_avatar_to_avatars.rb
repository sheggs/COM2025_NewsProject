class AddAttachmentAvatarToAvatars < ActiveRecord::Migration[5.2]
  def self.up
    change_table :avatars do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :avatars, :avatar
  end
end
