require_relative '../rails_helper'

RSpec.describe 'User response', type: :request do
  context 'users endpoint' do
    before(:example) { get '/users' }

    it 'get users render the template index' do
      expect(response).to render_template(:index)
    end

    it 'get users does not render a different template' do
      expect(response).to_not render_template(:show)
    end

    it 'get users has the correct layout' do
      expect(response.body).to include('Here should be displayed a list of the users')
    end

    it 'get users have ok stauts' do
      expect(response).to have_http_status(:ok)
    end
  end

  context 'users/show endpoint' do
    before(:example) { get '/users/1' }
    it 'get users render the template index' do
      expect(response).to render_template(:show)
    end

    it 'get users does not render a different template' do
      expect(response).to_not render_template(:index)
    end

    it 'get users has the correct layout' do
      expect(response.body).to include('Here should be displayed the selected user information')
    end

    it 'get users have ok stauts' do
      expect(response).to have_http_status(:ok)
    end
  end
end
