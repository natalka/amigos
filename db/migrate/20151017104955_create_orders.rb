class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.text :item_desc
      t.string :from
      t.string :to
      t.string :tracking_id

      t.timestamps null: false
    end
  end
end
