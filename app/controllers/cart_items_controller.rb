class CartItemsController < ApplicationController
  before_action :set_cartItem

  def index
  end

  def create
    unless @cart_items.exists?(menu_item_id: params[:itemId])
      CartItem.create!(user_id: @current_user.id, menu_item_id: params[:itemId], quantity: 1)
    end
    redirect_to "/"
  end

  def update
    cart_item = @cart_items.find(params[:id])
    quantity = params[:quantity].to_i
    if quantity <= 0
      # cart_item.destroy()
    else
      cart_item.update_attribute(:quantity, quantity)
    end
    redirect_to "/"
  end

  def destroy
    @cart_items.destroy_all
    redirect_to root_path
  end
end
