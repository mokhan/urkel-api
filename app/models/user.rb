class User < ActiveRecord::Base
  has_many :sessions
  has_many :videos
  validates :email, email: true

  has_secure_password

  def login(password)
    if authenticate(password)
      sessions.build
    else
      raise 'heck'
    end
  end
end
