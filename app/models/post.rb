class Post < ApplicationRecord
  belongs_to :user
  validates :user, presence: true

  validates :description

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://static.pexels.com/photos/4062/landscape-mountains-nature-lake.jpeg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
