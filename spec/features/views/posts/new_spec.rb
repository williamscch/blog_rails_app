require 'rails_helper'

RSpec.describe 'New post Page' do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @user1 = User.create(
      name: 'Jhon First',
      photo: 'https://randomuser.me/api/portraits/men/9.jpg',
      bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    )

    visit new_user_post_path(@user1)
  end

  it 'Have to be the right path' do
    expect(page.current_path).to eql('/users/1/posts/new')
  end

  it 'Should create the new post and redirects to the post show page' do
    find('#post_title').set('Post created for testing with Capybara')
    find('#post_text').set('Capybara is so useful for integration testing in rails')
    find("input[type='submit']").click
    expect(page.current_path).to eql('/users/1/posts/1')
  end
end
