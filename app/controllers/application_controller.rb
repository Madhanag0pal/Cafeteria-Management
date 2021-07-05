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
    else
      nil
    end
  end

  def set_cartItems
    @cart_items = @current_user.cart_items
  end

  def set_orders
    @orders = @current_user.orders
  end
end
