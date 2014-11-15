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
end
