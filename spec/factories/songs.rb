FactoryBot.define do
  factory :song do
    title { '651' }
    artist { 'J Dilla' }
    broadcast_date { DateTime.now }
  end
end
