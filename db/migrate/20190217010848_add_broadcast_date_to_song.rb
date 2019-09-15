# frozen_string_literal: true

class AddBroadcastDateToSong < ActiveRecord::Migration
  def change
    add_column :songs, :broadcast_date, :date
  end
end
