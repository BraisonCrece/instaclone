class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  validates :image, :body, presence: true
end
