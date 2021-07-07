class MenuItemsController < ApplicationController
  before_action :is_admin, :set_menu_item

  def update
    @menu_item.update(status: params[:status])
  end

  private

  def is_admin
    unless @current_user.admin?
      redirect_to root_path
    end
  end

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end
end
