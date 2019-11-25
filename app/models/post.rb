class Post < ApplicationRecord
  belongs_to :user
    has_attached_file :banner, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\z/
  validates_presence_of :title,:body,:summary, :banner
end
