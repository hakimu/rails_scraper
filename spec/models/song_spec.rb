require 'rails_helper'

RSpec.describe Song, type: :model do
  it 'is able to create a valid Song' do
    song = create(:song) 
    expect(song).to be_valid
  end
  
  it 'is not valid if there is not artist' do
    song = create(:song, artist: nil)
    expect(song).to_not be_valid
  end 
end
