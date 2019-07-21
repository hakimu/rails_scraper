class Like < ActiveRecord::Base
  belongs_to :song
  belongs_to :user
  validates :song, presence: true
  validates :user, presence: true 

  def self.top_likes
    self.joins(:song).group(:title).count
  end
end
