class Service < ActiveRecord::Base
  has_many :environments, dependent: :destroy
end
