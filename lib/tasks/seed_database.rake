namespace :songs do
  desc  'Rake task to add NPR songs to database'
  task :database => :environment do
    NPR::Scraper.new.call.each do |song|
      if Song.create({title: song[:title], artist: song[:artist]})
        Rails.logger.info "Songs successfully added to the database."
      else
        Rails.logger.info "Songs not added to the database."
      end
    end
  end
end

