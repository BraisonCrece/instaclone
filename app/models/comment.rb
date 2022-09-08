class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
end
