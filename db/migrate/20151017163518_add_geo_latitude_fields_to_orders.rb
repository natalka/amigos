class AddGeoLatitudeFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :geo_latitude, :string
    add_column :orders, :geo_longitude, :string
  end
end
