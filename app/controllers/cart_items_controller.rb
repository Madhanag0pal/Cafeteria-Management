class CartItemsController < ApplicationController
  before_action :set_cartItems, :is_customer

  def index
  end

  def create
    unless @cart_items.exists?(menu_item_id: params[:itemId])
      CartItem.create!(user_id: @current_user.id, menu_item_id: params[:itemId], quantity: 1)
    end
    redirect_to root_path
  end

  def update
    quantity = params[:quantity].to_i
    if cart_item = @cart_items.find_by(id: params[:id])
      if quantity <= 0
        cart_item.destroy()
      else
        cart_item.update_attribute(:quantity, quantity)
      end
    end
    redirect_to root_path
  end

  def destroy
    @cart_items.destroy_all
    redirect_to root_path
  end

  private

  def is_customer
    if @current_user.admin?
      redirect_to root_path
    end
  end
end
