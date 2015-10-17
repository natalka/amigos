class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def create
    @order = Order.create order_params
    redirect_to order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:to, :from, :item_desc, :to_geo_latitude, :to_geo_longitude, :from_geo_latitude, :from_geo_longitude)
  end
end
