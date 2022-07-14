class Post < ApplicationRecord
  belongs_to :user as: :author
  has_one_attached :image
  has_many :likes
end
