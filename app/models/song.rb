class Song < ActiveRecord::Base
  def self.week_of_songs
    where("broadcast_date < ?", 5.days.ago)
  end
end
