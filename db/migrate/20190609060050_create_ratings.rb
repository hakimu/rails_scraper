# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :star

      t.timestamps null: false
    end
  end
end
