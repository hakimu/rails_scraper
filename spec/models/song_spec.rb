# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Song, type: :model do
  it 'is able to create a valid Song' do
    song = create(:song)
    expect(song).to be_valid
  end
  it 'is able to have likes' do
    song = create(:song)
    user = create(:user)
    create(:like, song_id: song.id, user_id: user.id)
    expect(song.likes.count).to eq(1)
  end
  it 'is able to have multiple likes' do
    song = create(:song)
    user = create(:user)
    create(:like, song_id: song.id, user_id: user.id)
    create(:like, song_id: song.id, user_id: user.id)
    expect(song.likes.count).to eq(2)
  end
  context 'when given multiple ratings' do
    it 'is a able to calculate average stars' do
      song = create(:song)
      create(:rating, star: 1, song_id: song.id)
      create(:rating, star: 1, song_id: song.id)
      create(:rating, star: 5, song_id: song.id)
      expect(song.average_stars).to eq(2.3)
    end
  end
  context 'when a Song has no ratings' do
    it 'doesn\'t throw a NoMethodError when the Song does not have ratings' do
      song = create(:song)
      expect { song.average_stars }.to_not raise_error
    end
  end
end
