require "rails_helper"

describe '/sessions' do
  it "routes to sessions#new" do
    expect(get: 'sessions/new').to route_to(controller: 'sessions', action: 'new')
  end

  it "routes to sessions#create" do
    expect(post: 'sessions').to route_to(controller: 'sessions', action: 'create')
  end
end
