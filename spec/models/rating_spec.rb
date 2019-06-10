require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe '#create' do
    context 'When the \'MY_API_KEY\' environment variable is set' do
      it 'is able to create a new Rating record' do
        rating = create(:rating)
        expect(rating).to be_valid
      end
    end 
    context 'When the \'MY_API_KEY\' environment variable is NOT set' do
      it 'raises an error' do
        expect { create(:rating) }.to raise_error(CannotCreateRatingError)
      end
    end
  end
end
