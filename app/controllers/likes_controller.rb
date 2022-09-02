class LikesController < ApplicationController
  def create
    if params[:likeable_type] == 'Post'
      @likeable =  Post.find(params[:post_id])
    elsif params[:likeable_type] == 'Comment'
      @likeable = Comment.find(params[:comment_id])
    end
    current_user.like!(@likeable)
  end

  def destroy
    if params[:likeable_type] == 'Post'
      @likeable =  current_user.posts.find_by(id: params[:post_id])
      current_user.likes.where(likeable_type: 'Post', likeable_id: @likeable.id ).delete_all
    elsif params[:likeable_type] == 'Comment'
      @likeable = current_user.comments.find_by(id: params[:comment_id])
      current_user.likes.where(likeable_type: 'Comment', likeable_id: @likeable.id).delete_all
    end    
  end

end