class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.index :login, unique: true
      t.timestamps
    end
  end
end
