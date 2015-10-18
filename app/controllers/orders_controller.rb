class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def create
    @order = Order.new order_params
    if @order.save
      redirect_to order_path(@order.id)
    else
      flash.now[:error] = "Could not save order"
      render 'new'
    end
  end

  private
  def order_params
    params.require(:order).permit(:to, :from, :item_desc, :to_geo_latitude,
      :to_geo_longitude, :from_geo_latitude, :from_geo_longitude)
  end
end
