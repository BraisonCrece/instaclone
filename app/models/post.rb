class Post < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :delete_all

  validates :image, :body, presence: true