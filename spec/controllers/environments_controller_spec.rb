require 'rails_helper'

describe EnvironmentsController do
  let(:user) { user_session.user }
  let(:user_session) { create(:session) }

  before :each do
    session[:user_session_id] = user_session.id
  end

  describe '#index' do
    let(:first_env) { create(:environment) }
    let(:second_env) { create(:environment) }

    it 'returns environments' do
      xhr :get, :index, ids: [first_env.id, second_env.id]
      expect(assigns(:environments)).to match_array([first_env, second_env])
    end
  end

  describe "#show" do
    let(:environment) { create(:environment) }

    it 'returns info on the environment' do
      xhr :get, :show, id: environment.id
      expect(assigns(:environment)).to eql(environment)
    end
  end

  describe "#create" do
    let(:service) { create(:service) }

    it 'creates a new environment' do
      xhr :post, :create, environment: { name: 'development', service_id: service.id }

      expect(Environment.count).to eql(1)
      expect(Environment.last.name).to eql('development')
    end
  end
end
