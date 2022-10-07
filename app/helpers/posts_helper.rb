module PostsHelper
  def has_likes_on?(likeable)
    if user_signed_in?
      type = likeable.is_a?(Post) ? "Post" : "Comment"
      current_user.likes.find_by(likeable_type: type,likeable_id: likeable.id) 
    else
      type = likeable.is_a?(Post) ? "Post" : "Comment"
      Like.find_by(likeable_type: type,likeable_id: likeable.id)
    end

    # type = likeable.is_a?(Post) ? "Post" : "Comment"
    # if(current_user.likes.find_by(likeable_type: type, likeable_id: likeable.id) != nil){
    #   return true else return false
    # }
  end
end
