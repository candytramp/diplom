class CreateResearchEffortFiles < ActiveRecord::Migration
  def change
    create_table :research_effort_files do |t|
      t.text :description
      t.references :research_effort, index: true, null: false

      t.timestamps
    end
	'ALTER TABLE research_effort_files ADD FOREIGN KEY (research_effort_id) REFERENCES research_efforts(id)'
  end
end
