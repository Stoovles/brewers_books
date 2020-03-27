class BlurbsController < ApplicationController
  before_action :set_blurb, only: [:show]
  before_action :set_blurbs, only: [:index]
  before_action :require_permission, only: [:edit, :destroy]

  def require_permission
    binding.pry
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
    Blurb.create(blurb_params)
    render :json => {:response => 'Blurb Created' },:status => 201
  end

  def edit

  end

  def destroy
    blurb = Blurb.destroy(params[:id])
    render :json => {:response => 'Blurb Deleted' },:status => 200
  end

  private


  def set_blurb
    @blurb = Blurb.find(params[:id])
  end

  def set_blurbs
    @blurbs = Blurb.all
  end


end
