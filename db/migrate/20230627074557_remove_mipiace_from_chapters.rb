class RemoveMipiaceFromChapters < ActiveRecord::Migration[7.0]
  def change
    remove_column :chapters, :mipiace, :integer
  end
end
