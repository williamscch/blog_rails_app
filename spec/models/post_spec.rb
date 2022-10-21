require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
)
  subject do
    Post.new(user: user, title: 'LifeStyle',
             text: 'Nomad lifestyle is something really amazing, you should try it')
  end

  before { subject.save }

  it 'Validation of the post' do
    expect(subject).to be_valid
  end

  context 'Testing Title' do
    it 'Title must exists' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title length should be less than 250 characters' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'Title should be LifeStyle' do
      expect(subject.title).to match('LifeStyle')
    end
  end

  context 'Testing comments and likes counters' do
    it 'CommentsCounter has to be an integer' do
      expect(subject.CommentsCounter).to match(Integer)
    end

    it 'LikesCounter has to be an integer' do
        expect(subject.LikesCounter).to match(Integer)
      end
  end
end
