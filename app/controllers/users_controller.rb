class UsersController < ApplicationController
  def new
  end

  def create
    User.create(user_params)
    render :json => {:response => 'User Created' },:status => 201
  end
end
