require 'rails_helper'

describe NPR::FullShow do
  it 'finds all the urls on the page for the specified date' do
    urls = [
         'https://www.npr.org/programs/morning-edition/2019/02/28/698842803?showDate=2019-02-28',
         'https://www.npr.org/programs/morning-edition/2019/02/27/698463831?showDate=2019-02-27',
         'https://www.npr.org/programs/morning-edition/2019/02/26/698040168?showDate=2019-02-26',
         'https://www.npr.org/programs/morning-edition/2019/02/25/697602971/morning-edition-for-february-25-2019?showDate=2019-02-25',
         'https://www.npr.org/programs/morning-edition/2019/02/22/696942433?showDate=2019-02-22'
           ]
    expect(NPR::FullShow.new('2-28-2019').call).to eq(urls)
  end
  it 'can make an API call to the NRP endpoint' do
    expect(NPR::FullShow.new('2-28-2019').scrape_page).to be_an_instance_of(HTTParty::Response)
    expect(NPR::FullShow.new('2-28-2019').scrape_page.code).to eq(200)
  end
end
