class ApplicationController < ActionController::Base
  before_action :ensuer_user_logged_in

  def ensuer_user_logged_in
    unless current_user
      redirect_to root_path
    end
  end

  def current_user
    return @current_user if @current_user

    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
      @role = current_user.role
    else
      @role = Role.last
      nil
    end
  end

  def set_cartItems
    if current_user
      @cart_items = @current_user.cart_items
      @cart_menu_item_ids = @cart_items.map { |i| i.menu_item_id }
    end
  end

  def set_orders
    if @current_user
      if @current_user.customer?
        @orders = @current_user.orders.order(:status_id, updated_at: :desc)
      else
        @orders = Order.all.order(:status_id, updated_at: :desc)
      end
    end
  end
end
