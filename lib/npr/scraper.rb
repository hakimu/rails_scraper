require 'json'
require 'nokogiri'
require 'httparty'

module NPR
  class NPR::Scraper
    def call
      songs = []
      parse_artist.zip parse_song_title.each do |artist,title|
       songs << { artist: artist, title: title, broadcast_date: parse_broadcast_date }
      end
      songs 
    end

    private

    def scrape_page
      HTTParty.get('http://www.npr.org/programs/morning-edition/')
    end

    def parse_scraped_page
      Nokogiri::HTML(scrape_page)
    end

    def parse_broadcast_date
      parse_scraped_page.at('time[datetime]')['datetime']
    end

    def parse_artist
      artists = []
      parse_scraped_page.css('.song-meta-artist').each do |artist|
        artists << artist.text
      end
      artists
    end

    def parse_song_title
    	song_titles = []
    	parse_scraped_page.css('.song-meta-title').each do |title|
    	  song_titles << title.text
    	end
      song_titles
    end
  end
end
