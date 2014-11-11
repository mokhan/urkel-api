require 'rails_helper'

describe FailuresController do
  let(:user) { user_session.user }
  let(:user_session) { create(:session) }

  before :each do
    session[:user_session_id] = user_session.id
  end

  describe "#index" do
    let!(:failure) { create(:failure) }

    it 'returns all failures' do
      xhr :get, :index
      expect(assigns(:failures)).to match_array([failure])
    end
  end
end
