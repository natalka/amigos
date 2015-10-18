class AddWhoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :who, :string
  end
end
