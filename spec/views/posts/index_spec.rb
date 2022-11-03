require 'rails_helper'

RSpec.describe 'user/index endpoint', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Jhon First',
      photo: 'https://randomuser.me/api/portraits/men/9.jpg',
      bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    )
    @user2 = User.create(
      name: 'Jhon Second',
      photo: 'https://randomuser.me/api/portraits/men/9.jpg',
      bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    )
    visit users_path
  end
  it 'should shows the user names' do
    expect(page).to have_content('Jhon First')
    expect(page).to have_content('Jhon Second')
  end
end
