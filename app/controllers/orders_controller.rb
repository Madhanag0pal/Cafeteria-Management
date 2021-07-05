class OrdersController < ApplicationController
  before_action :set_cartItems,
                def create
                  order = Order.new(user_id: @current_user.id)
                end

  def update
  end
end
