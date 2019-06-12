class User < ActiveRecord::Base
  has_many :ratings
  has_many :songs, through: :ratings
  has_many :likes
  has_many :songs, through: :likes
  validates :username, :email, presence: true
end
