class CreateRoleUsers < ActiveRecord::Migration
  def change
    create_table :role_users do |t|
      t.references :user, index: true, null: false
      t.integer :role_id, null: false
      t.integer :department_id
      t.index [:user_id, :role_id, :department_id], unique: true
      t.index [:user_id, :role_id], unique: true, where: 'department_id is null'
      t.timestamps
    end
  end
end
