class AddVisibilityToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :visibility, :string, default: 'visibile'
  end
end
