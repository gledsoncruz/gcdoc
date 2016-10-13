class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title, null: false, limit: 80
      t.belongs_to :user, index: true, null: false
      t.text :description, null: true
      t.string :file_document

      t.timestamps null: false
    end
    add_foreign_key :documents, :users
  end
end
