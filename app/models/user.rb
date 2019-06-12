class User < ActiveRecord::Base
  has_many :songs
  has_many :ratings, through: :songs
  validates :username, :email, presence: true
end
