class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name, null: false, limit: 80
      t.decimal :price, null: false
      t.boolean :recurring, null: false, default: true
      t.string :period, null: false, limit: 20, default: 'month'
      t.integer :cycles, null: false
      t.integer :num_doc, null: false

      t.timestamps null: false
    end
  end
end
