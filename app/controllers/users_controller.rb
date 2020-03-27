class UsersController < ApplicationController
  #routing needs to be built out for users controller

  def new
  end

  def create
    User.create(user_params)
    render :json => {:response => 'User Created' },:status => 201
  end
end
