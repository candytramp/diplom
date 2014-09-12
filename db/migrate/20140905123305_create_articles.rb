class CreateArticles < ActiveRecord::Migration
def change
    create_table :articles do |t|
      t.text :name, :null=>false
      t.text :source
      t.integer :start_page, :null=>false
      t.integer :finish_page, :null=>false
      t.text :link
      t.integer :year, :null=>false
      t.timestamps
    end
    
    reversible do |dir|
      dir.up do
        # add a CHECK constraint
        execute <<-SQL
          ALTER TABLE articles
          ADD CONSTRAINT start_finish_year_limit
          CHECK (start_page > 0 AND finish_page > 0 AND year > 0);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE articles
          DROP CONSTRAINT start_finish_year_limit
        SQL
      end
    end
    
  end
end
