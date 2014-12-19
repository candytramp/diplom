class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.text :full_name, null: false
      t.string :short_name, null: false

      t.timestamps
    end
  end
end
