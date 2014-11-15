require 'rails_helper'

describe FailuresController do
  let(:user) { create(:user) }

  before { http_login(user) }

  describe "#index" do
    let!(:failure) { create(:failure) }

    it 'returns all failures' do
      xhr :get, :index
      expect(assigns(:failures)).to match_array([failure])
    end
  end
end
