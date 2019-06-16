require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe '#create' do
    context 'when given valid attributes' do
      it 'creates a valid Rating' do
        rating = build(:rating)
        expect { rating.save }.to change { Rating.count }.by(1) 
      end
    end
    context 'when given invalid attributes' do
      context 'when there is not a Song' do
        it 'does not save a Rating' do
          rating = build(:rating, song: nil)
          rating.save
          expect(rating.errors.full_messages).to include('Song can\'t be blank')
        end
      end
      context 'when there is not a User' do
        it 'does not save a Rating' do
          rating = build(:rating, user: nil)
          rating.save
          expect(rating.errors.full_messages).to include('User can\'t be blank')
        end
      end
      context 'when star is not 1-5' do
        it 'does not save a Rating' do
          rating = build(:rating, star: 99)
          rating.save
          expect(rating.errors[:star]).to include('Star should be 1-5.')  
        end
      end
    end
  end
end
