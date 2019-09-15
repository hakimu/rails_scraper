# frozen_string_literal: true

class Rating < ActiveRecord::Base
  belongs_to :song
  belongs_to :user
  validates :star, presence: true
  validates :star, inclusion: { in: (1..5), message: 'Star should be 1-5.' }
  validates :song, presence: true
  validates :user, presence: true
end
