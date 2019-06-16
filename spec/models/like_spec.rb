require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#create' do
    context 'when given proper attributes' do
      it 'creates a Like' do
        song = create(:song)
        user = create(:user)
        like = build(:like, song_id: song.id, user_id: user.id)
        expect { like.save }.to change { Like.count }.by(1)
      end
      it 'associates multiple likes with a Song' do
        song = create(:song)
        user = create(:user)
        create(:like, song_id: song.id, user_id: user.id)
        create(:like, song_id: song.id, user_id: user.id)
        expect(song.likes.count).to eq(2)
      end  
    end
    context 'when given incorrect attributes' do
      it 'is invalid without a User' do
        song = create(:song)
        like = build(:like, song_id: song.id, user_id: nil)
        like.save
        expect(like.errors.full_messages).to include('User can\'t be blank')
      end
      it 'is invalid without a Song' do
        user = create(:user)
        like = build(:like, user_id: user.id, song_id: nil)
        like.save
        expect(like.errors.full_messages).to include('Song can\'t be blank')
      end
    end
  end
end
