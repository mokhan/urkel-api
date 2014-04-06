require "spec_helper"

describe '/' do
  it "should route to the login page" do
    expect(get: '/').to route_to(controller: 'logins', action: 'new')
  end
end
