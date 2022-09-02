class CommentsController < ApplicationController
  def new; end

  def create
    @post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.post = @post
    comment.user = current_user

    if comment.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end