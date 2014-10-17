class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.references :article, index: true, null: false
      t.references :person, index: true, null: false
      t.string :old_lastname, limit: 64 #, null: false
      t.boolean :lecturer
      t.boolean :senior_lecturer
      t.boolean :student
      t.boolean :postgrad
      t.text :details
      t.string :creator_login
      t.text :creator_data

      t.timestamps
    end
		reversible do |dir|
      dir.up do
        'ALTER TABLE authors ADD FOREIGN KEY (article_id) REFERENCES articles(id)'
				'ALTER TABLE authors ADD FOREIGN KEY (person_id) REFERENCES people(id)'
			end
      dir.down do
      end
    end
  end
end
