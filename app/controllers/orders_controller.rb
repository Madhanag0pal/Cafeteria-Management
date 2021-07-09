class OrdersController < ApplicationController
  before_action :set_cartItems, :set_orders

  def index
    unless @current_user.customer?
      @orders = Order.all.order(:status_id, updated_at: :desc)
    end
  end

  def show
    if @current_user.admin?
      @orders = Order.all.order(:status_id, updated_at: :desc)
    end
    render :index
  end

  def create
    if @cart_items
      order = Order.create(user_id: @current_user.id, address: params[:address])
      @cart_items.place_order(order)
    end
    redirect_to root_path
  end

  def update
    id = params[:id].to_i
    if @current_user.customer?
      if @orders.exists?(id)
        @orders.update(id, status_id: 3)
      end
    else
      Order.update(id, status_id: params[:status_id].to_i)
    end
  end
end
