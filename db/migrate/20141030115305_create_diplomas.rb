class CreateDiplomas < ActiveRecord::Migration
  def change
    create_table :diplomas do |t|
      t.text :name, 							null: false
      t.date :issue_date
      t.text :issue_organization
      t.integer :year, 						null: false
      t.string :creator_login
      t.text :creator_data

			t.index :name, unique: true

      t.timestamps
    end
  end
end
