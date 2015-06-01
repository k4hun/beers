class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to show_beer_path(comment_params[:beer_id])
    else
      redirect_to show_beer_path(comment_params[:beer_id]),
                                 error: 'Couldn\'t add comment!'
    end
  end

  private
 
  def comment_params
    params.require(:comment).permit(:author, :content, :beer_id)
  end
end
