class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true, dependent: :delete
end