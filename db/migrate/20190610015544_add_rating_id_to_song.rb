class AddRatingIdToSong < ActiveRecord::Migration
  def change
    add_reference :songs, :rating, index: true, foreign_key: true
  end
end
