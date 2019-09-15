# frozen_string_literal: true

class RemoveRatingRefFromSongs < ActiveRecord::Migration
  def change
    remove_reference :songs, :rating, index: true, foreign_key: true
  end
end
