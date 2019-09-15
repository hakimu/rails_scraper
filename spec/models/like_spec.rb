# frozen_string_literal: true

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
      it 'calculates the Song with the top likes' do
        user = create(:user)
        popular_song = create(:song)
        moderately_popular_song = create(:song, title: 'Get Down')
        unpopular_song = create(:song, title: 'The Factory')
        100.times do |i|
          user = create(:user, username: "user_#{i}", email: "my_#{i}@example.com")
          create(:like, song_id: popular_song.id, user_id: user.id)
        end
        10.times do |i|
          user = create(:user, username: "user_#{i}", email: "my_#{i}@example.com")
          create(:like, song_id: moderately_popular_song.id, user_id: user.id)
        end
        create(:like, song_id: unpopular_song.id, user_id: user.id)
        expect(Like.top_likes).to eq([['651', 100], ['Get Down', 10], ['The Factory', 1]])
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
