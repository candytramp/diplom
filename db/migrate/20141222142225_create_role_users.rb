class CreateRoleUsers < ActiveRecord::Migration
  def change
    create_table :role_users do |t|
      t.references :user, index: true, null: false
      t.references :role, index: true, null: false
      t.text :department

      t.timestamps
    end
    reversible do |dir|
      dir.up do
        'ALTER TABLE role_users ADD FOREIGN KEY (user_id) REFERENCES users(id)'
        'ALTER TABLE role_users ADD FOREIGN KEY (role_id) REFERENCES roles(id)'
      end
    end
  end
end
