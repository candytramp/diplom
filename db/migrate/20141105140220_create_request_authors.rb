class CreateRequestAuthors < ActiveRecord::Migration
  def change
    create_table :request_authors do |t|
      t.references :ois_request, index: true, null: false
      t.references :person, index: true, null: false
      t.string :old_lastname, null: false
      t.boolean :is_teacher
      t.boolean :is_staffteacher
      t.boolean :is_student
      t.boolean :is_postgrad
      t.text :details

			t.index [:ois_request_id,:person_id], unique: true

      t.timestamps
    end
		reversible do |dir|
      dir.up do
 				execute <<-SQL
          ALTER TABLE request_authors
          ADD CONSTRAINT lastname_limit
          CHECK (LENGTH(old_lastname) > 0 AND LENGTH(old_lastname) <= 64 );
        SQL
        'ALTER TABLE request_authors ADD FOREIGN KEY (ois_request_id) REFERENCES ois_requests(id)'
				'ALTER TABLE request_authors ADD FOREIGN KEY (person_id) REFERENCES people(id)' 
      end
    end
  end
end
