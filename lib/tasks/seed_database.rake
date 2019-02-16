namespace :songs do
  task :database => :environment do
    NPR::Scraper.new.call.each do |song|
      Song.create({title: song.title, artist: song.artist})
    end
  end
end



