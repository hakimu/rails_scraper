require 'rails_helper'

RSpec.describe Song, type: :model do
  it 'is able to create a valid Song' do
    song = create(:song) 
    expect(song).to be_valid
  end
  it 'is able to have likes' do
    song = create(:song)
    create(:like, song_id: song.id)
    expect(song.likes.count).to eq(1)
  end
  it 'is able to have multiple likes' do
    song = create(:song)
    create(:like, song_id: song.id)
    create(:like, song_id: song.id)
    expect(song.likes.count).to eq(2)
  end
end
