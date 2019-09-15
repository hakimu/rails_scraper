# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :ratings
  has_many :songs, through: :ratings
  has_many :likes
  has_many :songs, through: :likes
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  validates :username, :email, presence: true
end
