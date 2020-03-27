class BlurbsController < ApplicationController
  before_action :set_blurb, only: [:show]
  before_action :set_blurbs, only: [:index]
  before_action :require_permission, only: [:edit, :destroy]

  #this method checks if the current_user (called from application controller)
  #is the owner of the resource they are attempting to change
  def require_permission
    if current_user != Blurb.find(params[:id]).user
      render :json => {:response => 'Forbidden' },:status => 403
    end
  end


  def show
    render json: BlurbSerializer.new(@blurb)
  end

  def index
    render json: BlurbSerializer.new(@blurbs)

  end

  def create
    current_user.blurbs.create(blurb_params)
    render :json => {:response => 'Blurb Created' },:status => 201
  end

  def edit
    #for another day
  end

  def destroy
    blurb = Blurb.destroy(params[:id])
    render :json => {:response => 'Blurb Deleted' },:status => 200
  end

  private

  def blurb_params
    params.permit(:summary)
  end

  #set_blurb and set_blurbs allows you to build out more params options
  #to give the api more flexibility in the future
  def set_blurb
    @blurb = Blurb.find(params[:id])
  end

  def set_blurbs
    @blurbs = Blurb.all
  end


end
