class AuthorizeApiRequest
  prepend SimpleCommand #allows for alias method calls

  def initialize(headers = {})
    @headers = headers
  end

  def call #this will act as a helper method for the authentication_controller
    user
  end

  private

  attr_reader :headers

  def user
    #For user to be assigned both the decoded_auth_token must exist
    #and a user must exist with that auth token
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    #decodes token from authorization header
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  #strips the token from the authorization header and returns
  #otherwise returns error
  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end
end
