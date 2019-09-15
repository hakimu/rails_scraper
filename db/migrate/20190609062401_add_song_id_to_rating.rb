# frozen_string_literal: true

class AddSongIdToRating < ActiveRecord::Migration
  def change
    add_reference :ratings, :song, index: true, foreign_key: true
  end
end
