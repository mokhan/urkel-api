require 'rails_helper'

describe Environment do
  describe ".create" do
    it 'generates an API key' do
      environment = Environment.create(name: 'development')
      expect(environment.api_key).to_not be_nil
    end
  end
end
