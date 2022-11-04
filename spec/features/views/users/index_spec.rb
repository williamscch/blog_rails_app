require 'rails_helper'

RSpec.describe 'user/index endpoint', type: :feature do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @user1 = User.create(
      id: 145,
      name: 'Jhon First',
      photo: 'https://randomuser.me/api/portraits/men/9.jpg',
      bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    )
    @user2 = User.create(
      id: 146,
      name: 'Jhon Second',
      photo: 'https://randomuser.me/api/portraits/men/9.jpg',
      bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    )
    @post1 = Post.create(title: 'LifeStyle',
                         text: 'Nomad lifestyle is something really amazing, you should try it', user_id: 145)
    @post2 = Post.create(title: 'LifeStyle',
                         text: 'Nomad lifestyle is something really amazing, you should try it', user_id: 146)

    visit users_path
  end
  it 'should shows the user names' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content('Jhon Second')
  end

  it 'should shows the profile picture of each user' do
    expect(page).to have_selector '.user-img', count: 2
    puts page
  end
  it 'should shows the number of posts each user has written' do
    expect(page).to have_content('Number of Posts: 1', count: 2)
  end
  it 'When I click on a user, I am redirected to that user show page' do
    click_on('Jhon Second')
    expect(page.current_path).to eql('/users/146')
  end
end
