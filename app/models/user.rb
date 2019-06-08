class User < ActiveRecord::Base
  has_many :songs
  validates :username, :email, presence: true
end
