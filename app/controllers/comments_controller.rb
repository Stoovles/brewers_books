class CommentsController < ApplicationController
  require 'pry'

  def create
    Blurb.find(params[:id]).comments.create(comment_params)
    render :json => {:response => 'Comment Created' },:status => 201
  end


  private

  def comment_params
    params.permit(:comment)
  end

end
