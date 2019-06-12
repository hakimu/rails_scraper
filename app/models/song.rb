class Song < ActiveRecord::Base
  has_many :ratings
  has_many :users, through: :ratings
  has_many :likes
  has_many :users, through: :likes

  def self.week_of_songs
    where("broadcast_date < ?", 5.days.ago)
  end

  #scope :week_of_songs, -> { where(broadcast_date: Date.current..(Date.current - 7)) }
  scope :week_of_songs, -> { where(broadcast_date: (Date.current - 7)..Date.current) }

  def self.top_artist(rank=10)
    all_artist = self.all.map { |song| song.artist } 
    all_artist.group_by { |obj| obj }.map{ |k,v| [k,v.count] }
  end

  def self.songs_by_artist(artist)
    where("artist LIKE ?", "%#{artist}%").map { |song| song.title }
  end
end
