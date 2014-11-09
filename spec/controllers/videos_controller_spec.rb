require 'rails_helper'

describe VideosController do
  context "#create" do
    let(:user) { User.create }
    let(:user_session) { Session.create!(user_id: user.id) }

    before :each do
      session[:user_session_id] = user_session.id
    end

    it "creates a new video" do
      post :create, video: { title: 'hello', url: '' }
      response.should be_success
    end
  end
end
