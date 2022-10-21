require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }

  before { subject.save }

  it 'Name must be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name must be less than 30 char' do
    subject.name = 'tomasrichradlisonjosedelasantisimatrinidadpontepalaciosyblanco'
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = 4
    expect(subject).to be_valid
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = 'david'
    expect(subject).to_not be_valid
  end

  context 'testing recent_posts method' do
    before(:each) do
      5.times do |post|
        Post.create(user: subject, title: "Hello #{post}", text: "This is my #{post} post")
      end
    end

    it 'should return the 3 latest posts' do
      expect(subject.recent_posts).to eq(Post.order(created_at: :desc).limit(3))
    end

    it 'should update the post counter' do
      expect(subject.posts_counter).to eq(5)
    end
  end
end
