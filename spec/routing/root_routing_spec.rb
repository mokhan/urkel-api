require "spec_helper"

describe '/' do
  it "should route to the login page" do
    expect(get: '/').to route_to(controller: 'dashboard', action: 'index')
  end
end
