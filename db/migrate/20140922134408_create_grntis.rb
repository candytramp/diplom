class CreateGrntis < ActiveRecord::Migration

  def change
    create_table :grntis do |t|
      t.string :grnti, limit: 2, null: false
      t.text :name, null: false
      t.timestamps
    end
    
	reversible do |dir|
      dir.up do
        # add a CHECK constraint
        execute <<-SQL
          ALTER TABLE grntis
          ADD CONSTRAINT grnti_limit
          CHECK (LENGTH(grnti) = 2);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE grntis
          DROP CONSTRAINT grnti_limit
        SQL
      end
    end
  end
end

