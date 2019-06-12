class AddSongRefToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :song, index: true, foreign_key: true
  end
end
