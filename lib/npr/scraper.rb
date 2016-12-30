require 'json'
require 'nokogiri'
require 'pry'
require 'httparty'

module NPR

  class NPR::Scraper
  
    def scrape_page
      HTTParty.get('http://www.npr.org/programs/morning-edition/')
    end

    def parse_scraped_page
      Nokogiri::HTML(scrape_page)
    end

    def parse_artist
      artists = []
      parse_scraped_page.css('.song-meta-artist').map do |artist|
        artists.push(artist.text)
      end
    end

    def parse_song_title
    	song_titles = []
    	parse_scraped_page.css('.song-meta-title').map do |title|
    	  song_titles.push(title.text)
    	end
    end

  end

end





