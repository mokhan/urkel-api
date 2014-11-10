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
end
