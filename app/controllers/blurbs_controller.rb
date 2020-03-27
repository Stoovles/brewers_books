class BlurbsController < ApplicationController
  before_action :set_blurb, only: [:show]
  before_action :set_blurbs, only: [:index]

  def show
    render json: @blurb
  end

  def index
    render json: BlurbSerializer.new(@blurbs)

  end

  def create
    Blurb.create(blurb_params)
    render :json => {:response => 'Blurb Created' },:status => 201
  end

  def destroy


  end

  private

  def blurb_params
    params.permit(:summary)
  end

  def set_blurb
    @blurb = Blurb.find(params[:id])
  end

  def set_blurbs
    @blurbs = Blurb.all
  end


end
