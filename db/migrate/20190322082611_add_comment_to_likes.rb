class AddCommentToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :comment, :string
  end
end
