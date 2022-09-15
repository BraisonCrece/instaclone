class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user, dependent: :delete
  has_many :comments, dependent: :delete_all
  has_many :likes, as: :likeable, dependent: :delete_all

  validates :image, :body, presence: true
end
