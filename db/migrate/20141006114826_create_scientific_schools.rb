class CreateScientificSchools < ActiveRecord::Migration
  def change
    create_table :scientific_schools do |t|
      t.string :name
			t.index :name, unique: true
      t.string :creator_login
      t.text :creator_data

      t.timestamps
    end
  end
end
