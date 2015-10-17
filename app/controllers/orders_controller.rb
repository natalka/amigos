class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def create
    Order.create order_params
    render text: 'Your delivery is registred'
  end

  private
  def order_params
    params.require(:order).permit(:to, :from, :item_desc)
  end
end
