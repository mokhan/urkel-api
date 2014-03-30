require "spec_helper"

describe '/logins' do
  it "routes to logins#new" do
    expect(get: 'logins/new').to route_to(controller: 'logins', action: 'new')
  end

  it "routes to logins#create" do
    expect(post: 'logins').to route_to(controller: 'logins', action: 'create')
  end
end
