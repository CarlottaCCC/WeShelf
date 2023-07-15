class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :testo
      t.references :chapter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
