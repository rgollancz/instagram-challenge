class Comment < ApplicationRecord
  belongs_to :user
  validates :user, presence: true

  belongs_to :post
  validates :post, presence: true
end
