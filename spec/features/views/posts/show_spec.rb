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
      text: 'I really like this post. This is the comment number 1'
    )

    @comment2 = Comment.create(
      user_id: @user2.id,
      post_id: @post1.id,
      text: 'I really like this post. This is the comment number 2'
    )

    @comment3 = Comment.create(
      user_id: @user2.id,
      post_id: @post1.id,
      text: 'I really like this post. This is the comment number 3'
    )

    @comment4 = Comment.create(
      user_id: @user2.id,
      post_id: @post1.id,
      text: 'I really like this post. This is the comment number 4'
    )

    @comment5 = Comment.create(
      user_id: @user2.id,
      post_id: @post1.id,
      text: 'I really like this post. This is the comment number 5'
    )

    @comment6 = Comment.create(
      user_id: @user2.id,
      post_id: @post1.id,
      text: 'I really like this post. This is the comment number 6'
    )

    visit user_post_path(@user1, @post1)
  end

  it 'should show the post title' do
    expect(page).to have_content 'LifeStyle'
    expect(page).to have_selector '.user-posts-post', count: 1
  end

  it 'should show who wrote the post' do
    expect(page).to have_content @user1.name
  end

  it 'should show the post body' do
    expect(page).to have_content @post1.text
  end

  it 'should shows how many comments the post has' do
    expect(page).to have_text "Comments: #{@post1.comments.count}"
  end

  it 'should shows how many likes a post has' do
    expect(page).to have_content "Likes: #{@post1.likes.count}"
  end

  it 'should shows the username of each commentor' do
    expect(page).to have_selector '.single-user-single-post-single-comment', count: 6
    expect(page).to have_content @user2.name, count: 6
  end

  it 'should shows the uthe comment each commentor left' do
    expect(page).to have_content @comment1.text
    expect(page).to have_content @comment2.text
    expect(page).to have_content @comment3.text
    expect(page).to have_content @comment4.text
    expect(page).to have_content @comment5.text
    expect(page).to have_content @comment6.text
  end
end