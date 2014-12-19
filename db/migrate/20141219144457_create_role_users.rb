class CreateRoleUsers < ActiveRecord::Migration
  def change
    create_table :role_users do |t|
      t.references :role, index: true
      t.references :user, index: true
      t.references :dept, polymorphic: true, index: true
      t.index [:user_id, :role_id, :dept_id], unique: true
      t.index [:user_id, :role_id], unique: true, where: 'dept_id is null'#?
      t.timestamps
    end
    reversible do |dir|
      dir.up do
         'ALTER TABLE role_users ADD FOREIGN KEY (role_id) REFERENCES roles(id)'
         'ALTER TABLE role_users ADD FOREIGN KEY (user_id) REFERENCES users(id)'
      end
    end
  end
end
