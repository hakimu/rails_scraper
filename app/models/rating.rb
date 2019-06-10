class Rating < ActiveRecord::Base
  has_many :songs
  validates :star, presence: true
  validates :star, inclusion: { in: [1,2,3,4,5], message: 'Star should be 1-5.' }

  before_create :check_admin_before_create
  
  def check_admin_before_create
    admin_key = ENV["MY_API_KEY"]
    raise CannotCreateRatingError.new('Not authorized') unless admin_key 
  end
end
