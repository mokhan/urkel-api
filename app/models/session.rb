class Session < ActiveRecord::Base
  belongs_to :user

  def access(request)
    {
      value: id,
      httponly: true,
      secure: Rails.env.production? || Rails.env.staging?,
      expires: 2.weeks.from_now
    }
  end
end
