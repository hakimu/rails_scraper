# frozen_string_literal: true

class RemoveSongIdFromRating < ActiveRecord::Migration
  def change
    remove_reference :ratings, :song, index: true, foreign_key: true
  end
end
