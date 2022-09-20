class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_img
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, presence: true

  def like!(obj)
    type = obj.is_a?(Post) ? "Post" : "Comment"
    likes << Like.new(user_id: obj.user_id, likeable_type: type, likeable_id: obj.id)
  end
end
