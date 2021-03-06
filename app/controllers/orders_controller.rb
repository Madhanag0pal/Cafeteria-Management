class OrdersController < ApplicationController
  before_action :set_orders

  def index
  end

  def show
    render :index
  end

  def create
    if @cart_items
      if @cart_items.present?
        # order = Order.create(user_id: @current_user.id, address: params[:address])
        # @cart_items.place_order(order)
      end
      OrderMailer.order_details(@current_user, @cart_items).deliver
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
      if status == 2 || status == 3
        Order.update(id, status_id: status)
      end
    end
    redirect_to orders_path
  end
end
