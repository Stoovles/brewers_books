class ApplicationController < ActionController::API
  before_action :authenticate_request
  #this will require token authentication before EVERY controller
  #action - this is not necessarily what we want for a social networking
  #site, but it does give strong initial security to begin with
  #moving forward we may want to only apply token authentcation to
  #actions such as create, destroy, edit, etc
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def current_user
    @current_user ||= AuthorizeApiRequest.call(request.headers).result
  end
end
