class AddNumClientToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :num_client, :integer, default: 0
  end
end
