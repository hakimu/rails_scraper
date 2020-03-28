class SongJsonResponseBuilder
  
  def initialize(user_id, song_id)
    @user_id = user_id
    @song_id = song_id
  end

  def call
    { user: set_user, song: set_song, likes: set_song.likes, ratings: set_song.ratings }
  end

  def set_user
    @user ||= User.find(@user_id)
  end

  def set_song
    @song ||= Song.find(@song_id)
  end
end
