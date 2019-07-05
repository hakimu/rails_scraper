require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid without a username' do
    user = build(:user, username: nil)
    user.save
    expect(user.errors.full_messages).to include('Username can\'t be blank') 
  end  
  it 'is invalid without an email' do
    user = build(:user, email: nil)
    user.save
    expect(user.errors.full_messages).to include('Email can\'t be blank')
  end
  it 'is able to have a Song associated with a User' do
    user = create(:user)
    song = create(:song)
    rating = create(:rating, user_id: user.id, song_id: song.id) 
    expect(user.ratings.count).to eq(1)
  end
end
