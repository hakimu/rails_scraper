class Song < ActiveRecord::Base
	
	def self.grab_parsed_artist
		NPR::Scraper.new.parse_artist[0]
	end

	def self.grab_parsed_title
		NPR::Scraper.new.parse_song_title[0]
	end

end

