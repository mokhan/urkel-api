require 'rails_helper'

describe ServicesController do
  let(:user) { user_session.user }
  let(:user_session) { create(:session) }

  before :each do
    session[:user_session_id] = user_session.id
  end

  describe "#index" do
    let!(:service) { create(:service) }

    it 'returns a list of all registered services' do
      xhr :get, :index
      expect(assigns(:services)).to include(service)
    end
  end

  describe "#create" do
    it 'creates a new service' do
      xhr :post, :create, service: { name: 'blah' }

      expect(Service.count).to eql(1)
      expect(Service.last.name).to eql('blah')
    end
  end

  describe "#destroy" do
    let(:service) { create(:service) }

    it 'deletes the services' do
      xhr :delete, :destroy, id: service.id
      expect(Service.count).to eql(0)
    end
  end
end
