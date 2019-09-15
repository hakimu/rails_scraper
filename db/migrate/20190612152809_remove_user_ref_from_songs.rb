# frozen_string_literal: true

class RemoveUserRefFromSongs < ActiveRecord::Migration
  def change
    remove_reference :songs, :user, index: true, foreign_key: true
  end
end
