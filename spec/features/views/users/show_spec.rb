require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @user1 = User.create(
      name: 'Jhon First',
      photo: 'https://randomuser.me/api/portraits/men/9.jpg',
      bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    )
    @post1 = Post.create(title: 'LifeStyle',
                         text: 'Nomad lifestyle is something really amazing, you should try it', user_id: @user1.id)
    @post2 = Post.create(title: 'LifeStyle2',
                         text: 'Nomad lifestyle is something really amazing, you should try it', user_id: @user1.id)
    @post3 = Post.create(title: 'LifeStyle3',
                         text: 'Nomad lifestyle is something really amazing, you should try it', user_id: @user1.id)
    @post4 = Post.create(title: 'LifeStyle4',
                         text: 'Nomad lifestyle is something really amazing, you should try it', user_id: @user1.id)
    visit "/users/#{@user1.id}"
  end

  it 'should show the users profile picture' do
    expect(page).to have_selector '.user-img', count: 1
  end

  it 'should show the username' do
    expect(page).to have_text 'Jhon First', count: 1
  end

  it 'should show the number of posts the user has written' do
    expect(page).to have_content 'Number of posts: 4'
  end
  
  it 'should show the user first 3 posts' do
    expect(page).to have_content @user1.bio
  end

  it 'should show the user bio' do
    expect(page).to have_selector '.user-post', maximum: 3
  end

  it 'should show a button that lets view all of a users posts' do
    expect(page).to have_button 'See all posts'
  end

  it 'When I click a user post, it redirects me to that post show page' do
    click_on @post4.title
    expect(page.current_path).to eql("/users/#{@user1.id}/posts/4")
  end

  it 'When I click to see all posts, it redirects me to the user posts index page' do
    click_link 'See all posts'
    expect(page.current_path).to eql("/users/#{@user1.id}/posts")
  end
end
