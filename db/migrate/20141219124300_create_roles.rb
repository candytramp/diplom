class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.integer :priority, null: false

      t.timestamps
    end
  end
end
