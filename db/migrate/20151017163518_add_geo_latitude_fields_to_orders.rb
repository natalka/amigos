class AddGeoLatitudeFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :to_geo_latitude, :string
    add_column :orders, :to_geo_longitude, :string

    add_column :orders, :from_geo_latitude, :string
    add_column :orders, :from_geo_longitude, :string
  end
end
