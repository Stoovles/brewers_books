class User < ApplicationRecord
  has_secure_password
  has_many :blurbs
  has_many :comments
end
