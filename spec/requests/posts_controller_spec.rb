require_relative '../rails_helper'

RSpec.describe 'Post response', type: :request do
  context 'posts endpoint' do
    before(:example) do
      User.create(
        id: 3,
        name: 'Jhon First',
        photo: 'https://randomuser.me/api/portraits/men/9.jpg',
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
      )
      get '/users/3/posts'
    end

    it 'get users render the template index' do
      expect(response).to render_template(:index)
    end

    it 'get users does not render a different template' do
      expect(response).to_not render_template(:show)
    end

    it 'get users has the correct layout' do
      expect(response.body).to include("Here should be displayed the users's posts")
    end

    it 'get users have ok stauts' do
      expect(response).to have_http_status(:ok)
    end
  end

  context 'users/show endpoint' do
    before(:example) do
      User.create(
        id: 2,
        name: 'Jhon First',
        photo: 'https://randomuser.me/api/portraits/men/9.jpg',
        bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
      )
      Post.create(title: 'Post-1}',
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis commodo velit.
        Maecenas quis tortor nec neque ornare pharetra vitae in quam.',
                  id: 2, user_id: 2)
      get '/users/2/posts/2'
    end

    it 'get users render the template show' do
      expect(response).to render_template(:show)
    end

    it 'get users does not render a different template' do
      expect(response).to_not render_template(:index)
    end

    it 'get users has the correct layout' do
      expect(response.body).to include('Here should be displayed the users selected post')
    end

    it 'get users have ok stauts' do
      expect(response).to have_http_status(:ok)
    end
  end
end
