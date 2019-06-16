class Like < ActiveRecord::Base
  belongs_to :song
  belongs_to :user
  validates :song, presence: true
  validates :user, presence: true 
end
