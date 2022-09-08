module PostsHelper
  def has_likes_on?(likeable)
    current_user.likes.find_by(likeable_id: likeable.id) 
  end
end
