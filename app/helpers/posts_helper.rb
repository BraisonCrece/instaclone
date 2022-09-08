module PostsHelper
  def has_likes_on?(likeable)
    if current_user
      type = likeable.is_a?(Post) ? "Post" : "Comment"
      current_user.likes.find_by(likeable_type: type,likeable_id: likeable.id) 
    end
  end
end
