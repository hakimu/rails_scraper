class Like < ActiveRecord::Base
  belongs_to :song
  belongs_to :user
  validates :song, presence: true
  validates :user, presence: true

  def self.top_likes(num = 10)
    joins(:song).group(:title).count.sort_by { |_, value| value }.reverse.take(num)
  end
end
