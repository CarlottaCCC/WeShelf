class AddLikesToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :likes, :integer
  end
end
