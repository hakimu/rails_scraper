class ChangeStarsToBeDecimalInRatings < ActiveRecord::Migration
  def change
    change_column :ratings, :star, :decimal, precision: 2, scale: 1
  end
end
