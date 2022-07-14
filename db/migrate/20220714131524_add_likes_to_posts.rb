class AddLikesToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :likes, :integer, default: 0
  end
end
