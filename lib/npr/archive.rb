require 'json'
require 'nokogiri'
require 'httparty'

module NPR
  class NPR::Archive
    def call
      songs = []
      parse_title_artist.each do |song|
        songs << { title: song[:title], artist: song[:artist], broadcast_date: parse_broadcast_date }
      end
      songs
    end

    private

    def scrape_page
      HTTParty.get("https://www.npr.org/programs/morning-edition/archive?date=1-31-2019")
    end

    def archive_date
      parse_scraped_page.at('time[datetime]')['datetime']
    end

    def parse_scraped_page
      Nokogiri::HTML(scrape_page)
    end

    def parse_broadcast_date
      parse_scraped_page.at('time[datetime]')['datetime']
    end

    def parse_title_artist
      songs = []
      parse_scraped_page.css('.song-meta-wrap').each do |song|
        songs << { title: song.css('.song-meta-title').text, artist: song.css('.song-meta-artist').text}
      end
      songs
    end
  end
end
