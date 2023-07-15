class AddAttachmentCoverToBooks < ActiveRecord::Migration[7.0]
 # def self.up
  #  change_table :books do |t|
   #   t.attachment :cover
  #  end
  
  def up
    add_attachment :books, :cover
  end

  def self.down
    remove_attachment :books, :cover
  end
end
