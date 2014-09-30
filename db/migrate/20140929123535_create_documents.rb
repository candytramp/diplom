class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.text :description
      t.references :owner, polymorphic: true, index: true

      t.timestamps
    end
  end
end
