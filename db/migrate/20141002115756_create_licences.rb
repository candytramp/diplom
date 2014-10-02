class CreateLicences < ActiveRecord::Migration
  def change
    create_table :licences do |t|
      t.string :number, null: false, limit: 16
      t.date :reg_date
      t.string :type, null: false, limit: 32
      t.text :name, null: false
      t.date :expiration_date, null: false

      t.string :req_number, null: false
      t.text :req_author, null: false
      t.text :req_object, null: false
      t.string :req_status, null: false
      t.string :reg_agency, null: false
			t.date :req_priority, null: false #can it be empty in request?

      t.string :support, null: false
      t.text :reseff_name#, null: true

      t.timestamps
    end

 		reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE licences
          ADD CONSTRAINT number_type_limit
          CHECK (LENGTH(number) > 0 AND LENGTH(number) < 16 AND LENGTH(type) > 0 AND LENGTH(type) < 32);
        SQL
      end
      dir.down do1
        execute <<-SQL
          ALTER TABLE licences
          DROP CONSTRAINT number_type_limit
        SQL
      end
    end

  end
end
