class AddSongToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :song, index: true, foreign_key: true
  end
end
