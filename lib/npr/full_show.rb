require 'json'
require 'nokogiri'
require 'httparty'

module NPR
  class NPR::FullShow
    def initialize(date)
      @date = date
    end

    def call
      [
        'https://www.npr.org/programs/morning-edition/2019/02/28/698842803?showDate=2019-02-28',
        'https://www.npr.org/programs/morning-edition/2019/02/27/698463831?showDate=2019-02-27',
        'https://www.npr.org/programs/morning-edition/2019/02/26/698040168?showDate=2019-02-26',
        'https://www.npr.org/programs/morning-edition/2019/02/25/697602971/morning-edition-for-february-25-2019?showDate=2019-02-25',
        'https://www.npr.org/programs/morning-edition/2019/02/22/696942433?showDate=2019-02-22'
      ]
    end

    def scrape_page
      HTTParty.get('https://www.npr.org/programs/morning-edition/archive?date=2-28-2019')
    end

    def parse_scraped_page
      Nokogiri::HTML(scrape_page)
    end
  end
end

NPR::FullShow.new('').parse_scraped_page.css('.program-show__title').each do |thing|
  p thing
end
