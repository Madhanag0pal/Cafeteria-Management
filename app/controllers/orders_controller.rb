class OrdersController < ApplicationController
  before_action :set_cartItems, :set_orders

  def index
  end

  def show
    render :index
  end

  def create
    if @cart_items
      order = Order.create(user_id: @current_user.id, address: params[:address])
      @cart_items.place_order(order)

      if @role.customer?
        redirect_to order_path(id: @current_user.id)
      else
        redirect_to root_path
      end
    end
  end

  def update
    id = params[:id].to_i
    if @current_user.customer?
      if @orders.exists?(id)
        @orders.update(id, status_id: 3)
      end
    else
      status = params[:status_id].to_i
      if 2..3 in status
        Order.update(id, status_id: status)
      end
    end
    redirect_to orders_path
  end
end
