class Environment < ActiveRecord::Base
  belongs_to :service
  before_create :create_api_key

  private

  def create_api_key
    self.api_key = SecureRandom.uuid
  end
end
