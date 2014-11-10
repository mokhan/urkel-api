class User < ActiveRecord::Base
  has_many :sessions
  has_many :videos
  has_secure_password
end
