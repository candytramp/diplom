class CreateArticleAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.references :article, index: true, null: false
      t.references :person, index: true, null: false
      t.string :old_lastname, limit: 64 #, null: false
      t.boolean :is_teacher
      t.boolean :is_state_teacher
      t.boolean :is_student
      t.boolean :is_postgrad
      t.text :details
      t.index [:article_id, :person_id], unique: true

      t.timestamps
    end
		reversible do |dir|
      dir.up do
        'ALTER TABLE authors ADD FOREIGN KEY (article_id) REFERENCES articles(id)'
				'ALTER TABLE authors ADD FOREIGN KEY (person_id) REFERENCES people(id)'
			end
    end
  end
end
