class CreateTextbooks < ActiveRecord::Migration
  def change
    create_table :textbooks do |t|
      t.string :isbn,    limit: 32, null: false
      t.text :title,      null: false
      t.text :publisher,  null: false
      t.integer :year,    null: false
      t.text :grif,       null: false
      t.integer :publish_year
      t.decimal :pages,   null: false#????/precision: 12, scale: 2
      t.text :textbook_type
			t.index :title, unique: true

      t.timestamps
    end
			reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE textbooks
          ADD CONSTRAINT grif_check
          CHECK (grif IN ('гриф УМО или НМС', 'гриф Рособразования (Минобразования России)', 
								'гриф других федеральных органов исполнительной власти', 'другой гриф', 'без грифа'));
        SQL
        execute <<-SQL1
          ALTER TABLE textbooks
          ADD CONSTRAINT ttype_check
          CHECK (textbook_type IN ('учебник', 'учебное пособие', 'учебно-методическое пособие','методическое пособие'));
        SQL1
  			execute <<-SQL2
          ALTER TABLE textbooks
          ADD CONSTRAINT publisher_check
          CHECK (publisher IN ('Зарубежное издательство','Российское издательство: "Высшая школа"',
								'Российское издательство: вуза (организации)','Российское издательство'));
        SQL2
 				execute <<-SQL3
          ALTER TABLE textbooks
		 		 	ADD CONSTRAINT year_max_value
		  		CHECK (year <= CAST(EXTRACT(year from now()) as Integer));
	    	SQL3
      end
    end
  end
end
