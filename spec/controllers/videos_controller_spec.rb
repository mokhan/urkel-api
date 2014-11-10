require 'rails_helper'

describe VideosController do
  let(:user_session) { create(:session) }

  before :each do
    session[:user_session_id] = user_session.id
  end

  describe "#index" do
    render_views

    let!(:video) { create(:video) }

    it 'returns all the videos' do
      xhr :get, :index
      expect(assigns(:videos)).to include(video)
    end
  end


  context "#create" do
    render_views

    it "creates a new video" do
      xhr :post, :create, video: { title: 'hello', uri: 'http://youtu.be/jghvdDB-t30?list=PLYuXlc3r66uFJErV5rYpZRcD8oDGtQlQc' }
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json['video']['id']).to_not be_nil
      expect(json['video']['title']).to eql('hello')
      expect(json['video']['description']).to be_nil
      expect(json['video']['uri']).to eql("http://youtu.be/jghvdDB-t30?list=PLYuXlc3r66uFJErV5rYpZRcD8oDGtQlQc")
    end
  end

  context "#update" do
    render_views
    let(:video) { create(:video, user: user_session.user) }

    it 'updates the video' do
      xhr :put, :update, id: video.id, video: { title: 'hello', description: 'blah', uri: 'http://youtu.be/blah' }
      video.reload
      expect(video.title).to eql('hello')
      expect(video.description).to eql('blah')
      expect(video.uri).to eql('http://youtu.be/blah')
    end

    it 'responds with the proper json' do
      xhr :put, :update, id: video.id, video: { title: 'hello', description: 'blah', uri: 'http://youtu.be/blah' }
      json = JSON.parse(response.body)
      expect(json['video']['id']).to eql(video.id)
      expect(json['video']['title']).to eql('hello')
      expect(json['video']['description']).to eql('blah')
      expect(json['video']['uri']).to eql("http://youtu.be/blah")
    end
  end
end
