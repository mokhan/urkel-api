class User < ActiveRecord::Base
  has_many :sessions
  has_many :videos
  validates :email, email: true

  has_secure_password

  def login(password)
    sessions.build if authenticate(password)
  end
end
