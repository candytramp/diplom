class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :name
      t.text :source
      t.integer :start_page
      t.integer :finish_page
      t.text :link
      t.integer :year

      t.timestamps
    end
  end
end
