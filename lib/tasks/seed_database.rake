namespace :songs do
  desc  'Rake task to add NPR songs to database'
  task :database => :environment do
    NPR::Scraper.new.call.each do |song|
      if Song.create({title: song[:title], artist: song[:artist], broadcast_date: song[:broadcast_date]})
        Rails.logger.info "Songs successfully added to the database."
      else
        Rails.logger.info "Songs not added to the database."
      end
    end
  end
end

def song_previously_saved?(current_date)
  last_saved_date = Song.last.broadcast_date ||= current_date
  last_saved_date == current_date ? true : false
end

