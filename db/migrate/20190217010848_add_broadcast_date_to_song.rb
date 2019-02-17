class AddBroadcastDateToSong < ActiveRecord::Migration
  def change
    add_column :songs, :broadcast_date, :date
  end
end
