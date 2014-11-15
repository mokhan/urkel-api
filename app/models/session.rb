class Session < ActiveRecord::Base
  belongs_to :user

  def access(request)
    if save
      {
        value: self.id,
        httponly: true,
        secure: Rails.env.production? || Rails.env.staging?,
        expires: 2.weeks.from_now
      }
    else
      raise "heck"
    end
  end

  def revoke!
    update_attribute(:revoked_at, Time.now.utc)
  end

  class << self
    def authenticate!(session_key)
      Session.find(session_key)
    end
  end
end
