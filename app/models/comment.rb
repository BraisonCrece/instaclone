class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, dependent: :delete
  has_many :likes, as: :likeable, dependent: :delete_all
end
