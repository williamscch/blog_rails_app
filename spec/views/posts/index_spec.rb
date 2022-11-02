require 'rails_helper'

Rspec.describe 'user/index endpoint', type: system do
  before do
    driven_by(:rack_tests)
  end
  context 'the username of all the users is visible' do
    before do
      @user = User.create(name: 'Garnacho Guedes', photo: 'https://randomuser.me/api/portraits/men/33.jpg',
                          bio: 'I am a chef on California Hard Rock Hotel')
      visit root_path
    end
  end
end
