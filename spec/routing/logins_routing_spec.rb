require "spec_helper"

describe '/logins' do
  it "routes to logins#new" do
    expect(get: 'logins/new').to route_to(controller: 'logins', action: 'new')
  end
end
