class AddAttachmentBannerToPosts < ActiveRecord::Migration[5.2]
  def self.up
    change_table :posts do |t|
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :posts, :banner
  end
end
