require 'rails_helper'

describe ServicesController do
  let(:user) { create(:user) }

  before { http_login(user) }

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

  describe "#update" do
    let(:service) { create(:service) }

    it 'updates the service' do
      xhr :put, :update, id: service.id, service: { name: 'new name' }
      service.reload
      expect(service.name).to eql('new name')
    end
  end
end
