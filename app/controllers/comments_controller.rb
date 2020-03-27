class CommentsController < ApplicationController

  def create
    Blurb.find(params[:id]).comments.create(comment_params)
    render :json => {:response => 'Comment Created' },:status => 201
  end

  def destroy
    comment = Comment.destroy(params[:id])
    render :json => {:response => 'Comment Deleted' },:status => 200
  end


  private

  def comment_params
    params.permit(:comment)
  end

end
