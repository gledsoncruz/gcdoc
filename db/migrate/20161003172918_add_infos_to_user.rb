class AddInfosToUser < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string, null: false, limit: 80
    add_column :users, :cpf, :string, null: true, limit: 15
    add_column :users, :cel, :string, null: true, limit: 15
    add_column :users, :pass_changed, :boolean, default: false
  end
end
