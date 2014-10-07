class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :creator_login
      t.text :creator_data

      t.timestamps
    end
  end
end
