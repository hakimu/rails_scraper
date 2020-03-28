class SongJsonResponseBuilder
  
  def initialize(user_id, song_id)
    @user_id = user_id
    @song_id = song_id
  end

  def call
    set_song.likes.map(&:to_json)
  end

  def set_user
    @user ||= User.find(@user_id)
  end

  def set_song
    @song ||= Song.find(@song_id)
  end
end
