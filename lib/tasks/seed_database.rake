require 'tasks/newrelic'

namespace :songs do
  desc 'Rake task to add NPR songs to database'
  task database: :environment do
    songs = NPR::Scraper.new.call
    if song_previously_saved?(songs.last[:broadcast_date])
      Rails.logger.info 'Songs not added to the database. Already saved.'
    else
      Song.create(songs)
      Rails.logger.info 'Songs successfully added to the database.'
    end
  end
end

def song_previously_saved?(current_date)
  last_saved_date = Song&.last&.broadcast_date
  last_saved_date == Date.parse(current_date) ? true : false
end
