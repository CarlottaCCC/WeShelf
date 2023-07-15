class AddStatoToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :stato, :string, default: 'inpubblicazione'
  end
end
