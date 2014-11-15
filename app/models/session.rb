class Session < ActiveRecord::Base
  belongs_to :user
  before_create :create_key

  def access(request)
    self.ip_address = request.remote_ip
    if save
      {
        value: self.key,
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
    def active
      where(revoked_at: nil)
    end

    def authenticate!(session_key)
      active.find_by!(key: session_key)
    end
  end

  private

  def create_key
    self.key = SecureRandom.uuid
  end
end
