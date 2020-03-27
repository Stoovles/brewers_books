class JsonWebToken
 class << self

#class must be included in the rails runtime config/application.rb

   #takes the params User_id, key validity duration, rails unique base key)
   #and returns a unique token
   def encode(payload, exp = 24.hours.from_now)
     payload[:exp] = exp.to_i
     JWT.encode(payload, Rails.application.secrets.secret_key_base)
   end

   #takes in the token generated
   #and uses the applications secret key to decode it
   def decode(token)
     body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
     HashWithIndifferentAccess.new body
   rescue
     nil
   end
 end
end
