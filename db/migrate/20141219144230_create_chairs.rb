class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.text :name
      t.integer :number
      t.references :department, index: true

      t.timestamps
    end
  end
end
