require 'rails_helper'

RSpec.describe 'User Posts index page' do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
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

    @post1 = Post.create(title: 'LifeStyle',
                         text: 'Nomad lifestyle is something really amazing, you should try it', user_id: @user1.id)

    @comment1 = Comment.create(
      user_id: @user2.id,
      post_id: @post1.id,
      text: 'I really like this post. This is the comment number'
    )

    @comment2 = Comment.create(
      user_id: @user2.id,
      post_id: @post1.id,
      text: 'I really like this post. This is the comment number'
    )

    @comment3 = Comment.create(
      user_id: @user2.id,
      post_id: @post1.id,
      text: 'I really like this post. This is the comment number'
    )

    @comment4 = Comment.create(
      user_id: @user2.id,
      post_id: @post1.id,
      text: 'I really like this post. This is the comment number'
    )

    @comment5 = Comment.create(
      user_id: @user2.id,
      post_id: @post1.id,
      text: 'I really like this post. This is the comment number'
    )

    @comment6 = Comment.create(
      user_id: @user2.id,
      post_id: @post1.id,
      text: 'I really like this post. This is the comment number'
    )

    visit user_posts_path(@user1, @post1)
  end

  it 'should show the number of posts the user has written' do
    expect(page).to have_content 'Number of posts: 4'
  end

  it 'should show the posts title' do
    expect(page).to have_content 'LifeStyle'
    expect(page).to have_selector '.user-posts-post', count: 4
  end

  it 'should show the posts body' do
    expect(page).to have_content @post1.text
  end

  it 'should shows the first 5 comments on a post' do
    expect(page).to have_text 'I really like this post.', count: 5
  end

  it 'should shows how many comments a post has' do
    expect(page).to have_text "Comments: #{@post1.comments.count}"
  end

  it 'should shows how many likes a post has' do
    expect(page).to have_content "Likes: #{@post1.likes.count}"
  end

  it 'When I click on a post, it redirects me to that post show page' do
    click_on @post4.title
    expect(page.current_path).to eql("/users/#{@user1.id}/posts/4")
  end
end
