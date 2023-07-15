class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.text :titolo
      t.text :testo
      t.integer :mipiace
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
