class AddAttachmentAvatarToUsers < ActiveRecord::Migration[7.0]
  #def self.up
   # change_table :users do |t|
     # t.attachment :avatar
   # end
 # end
  def up
    add_attachment :users, :avatar 
  end

  def self.down
    remove_attachment :users, :avatar
  end
end
