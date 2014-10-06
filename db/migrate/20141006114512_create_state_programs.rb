class CreateStatePrograms < ActiveRecord::Migration
  def change
    create_table :state_programs do |t|
      t.text :name, null: false
			t.index :name, unique: true
      t.string :creator_login
      t.text :creator_data

      t.timestamps
    end
  end
end
