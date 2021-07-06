class OrdersController < ApplicationController
  before_action :set_cartItems, :set_orders

  def index
  end

  def create
    if @cart_items
      order = Order.create(user_id: @current_user.id, address_id: params[:address_id])
      @cart_items.place_order(order, params[:address_id])
    end
    redirect_to root_path
  end

  def update
  end
end
