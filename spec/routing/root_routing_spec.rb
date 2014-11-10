require "rails_helper"

describe '/' do
  it "routes to the login page" do
    expect(get: '/').to route_to(controller: 'dashboard', action: 'index')
  end
end
