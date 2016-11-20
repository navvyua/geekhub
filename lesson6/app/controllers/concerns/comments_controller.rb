class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    @comment.save

    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end