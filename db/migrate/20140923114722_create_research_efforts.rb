class CreateResearchEfforts < ActiveRecord::Migration
  def change
    create_table :research_efforts do |t|
      t.text :name, null: false
      t.references :state_program, index: true, null: false
      t.date :start_date, null: false #проверить дату
      t.date :finish_date, null:false
      t.references :grnti, index: true, null: false
      t.references :field, index: true, null: false
      t.decimal :full_value, precision: 5, scale: 2
      t.text :year_value
      t.integer :state_reg_number, null: false
      t.integer :nir_number, null: false
      t.integer :inventory_number, null: false  #инвентарный номер
      t.references :nir_type, index: true, null: false
      t.references :source, index: true, null: false
      t.text :scientific_school, null: false
			t.boolean :is_nir, null: false

      t.timestamps
    end

	'ALTER TABLE research_efforts ADD FOREIGN KEY (state_program_id) REFERENCES state_programs(id)'
	'ALTER TABLE research_efforts ADD FOREIGN KEY (grnti_id) REFERENCES grntis(id)'
	'ALTER TABLE research_efforts ADD FOREIGN KEY (field_id) REFERENCES fields(id)'
	'ALTER TABLE research_efforts ADD FOREIGN KEY (nir_type_id) REFERENCES nir_types(id)'
	'ALTER TABLE research_efforts ADD FOREIGN KEY (source_id) REFERENCES sources(id)'
	reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE research_efforts
          ADD CONSTRAINT positive_check
          CHECK (state_reg_number > 0 AND nir_number > 0 AND inventory_number > 0 AND full_value > 0.0);
        SQL
	
      
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE research_efforts
          DROP CONSTRAINT positive_check
        SQL
      end
    end
  end
end
