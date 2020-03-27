class AuthenticateUser
  prepend SimpleCommand #allows for alias method calls

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email) #user lookup by email

    #return the user if it exists and has correct login
    #authenticate is a built-in method for User given by
    #has_secure_password denotion in the model
    return user if user && user.authenticate(password)

    #otherwise throw credentials error
    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
