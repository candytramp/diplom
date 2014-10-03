class CreateOisRequests < ActiveRecord::Migration
  def change
    create_table :ois_requests do |t|
      t.string :number, null: false
      t.date :priority, null: false
      t.text :author, 	null: false
      t.text :name			
      t.text :object, 	null: false
      t.string :reg_agency, null: false
      t.references :research_effort, index: true
      t.string :status, null: false #default value?

      t.timestamps
    end
    reversible do |dir|
      dir.up do
        'ALTER TABLE ois_requests ADD FOREIGN KEY (research_effort_id) REFERENCES research_efforts(id)'  
      end
      dir.down do
      end
    end
  end
end
