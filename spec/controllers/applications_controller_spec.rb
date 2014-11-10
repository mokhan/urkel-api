require 'rails_helper'

describe ApplicationsController do
  let(:user) { user_session.user }
  let(:user_session) { create(:session) }

  before :each do
    session[:user_session_id] = user_session.id
  end

  describe "#index" do
    let!(:application) { create(:application) }

    it 'returns a list of all registered applications' do
      xhr :get, :index
      expect(assigns(:applications)).to include(application)
    end
  end

  describe "#create" do
    it 'creates a new application' do
      xhr :post, :create, application: { name: 'blah' }

      expect(Application.count).to eql(1)
      expect(Application.last.name).to eql('blah')
    end
  end
end
