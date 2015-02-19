class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.integer :priority, null: false
      t.index :name, unique: true
      t.timestamps
    end
    reversible do |dir|
      dir.up do
        # add a CHECK constraint
        execute <<-SQL
          ALTER TABLE roles
          ADD CONSTRAINT priority_limit
          CHECK (priority >= 0);
        SQL
      end
    end
  end
end
