class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :titolo
      t.text :trama
      t.text :tag
      t.text :genere

      t.timestamps
    end
  end
end
