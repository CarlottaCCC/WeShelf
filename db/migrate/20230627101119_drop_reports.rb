class DropReports < ActiveRecord::Migration[7.0]
  def change

    
    drop_table :reports
    
  end
end
