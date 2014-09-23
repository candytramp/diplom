class CreateStatePrograms < ActiveRecord::Migration
  def change
    create_table :state_programs do |t|
      t.text :name, null: false
      t.timestamps
    end
  end
end
