class Like < ActiveRecord::Base
  belongs_to :song
  belongs_to :user
  validates :song, presence: true
  validates :user, presence: true 

  def self.top_likes(n=10)
    self.joins(:song).group(:title).count.sort_by {|k,v| v}.reverse.take(n)
  end
end
