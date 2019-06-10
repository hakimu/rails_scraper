require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'associates multiple songs with a like' do
    song = create(:song)
    create(:like, song_id: song.id)
    create(:like, song_id: song.id)
    expect(song.likes.count).to eq(2)
  end  
end
