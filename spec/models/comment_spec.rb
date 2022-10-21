require 'rails_helper'
RSpec.describe Comment, type: :model do
  # tests go here
  subject do
    Comment.new(text: 'I dont mind spend every day under the rain with no cover')
  end

  before { subject.save }

  it 'Text should be I dont mind spend every day under the rain with no cover' do
    expect(subject.text).to match('I dont mind spend every day under the rain with no cover')
  end

  it 'Text must exists' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'Text length should be less than 300 characters' do
    subject.text = 'a' * 450
    expect(subject).to_not be_valid
  end
end
