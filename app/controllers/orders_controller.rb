class OrdersController < ApplicationController
  def create
    Order.create order_params
    render text: 'Your delivery is registred'
  end

  private
  def order_params
    params.require(:order).permit(:to, :from, :item_desc)
  end
end
