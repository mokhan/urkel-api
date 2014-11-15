class User < ActiveRecord::Base
  has_many :sessions
  has_many :videos
  validates :email, email: true

  has_secure_password
end
