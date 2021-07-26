class MenuCategoryItemsController < ApplicationController
  before_action :is_admin

  def create
    menu_category_item = MenuCategoryItem.find_or_create_by(menu_category_id: params[:menu_category_id], menu_item_id: params[:menu_item_id])
    unless params[:add]
      menu_category_item.destroy
    end
    redirect_to new_menu_category_item_path(menu_category_id: params[:menu_category_id])
  end

  def new
    @category = MenuCategory.find(params[:menu_category_id])
    @category_items = MenuCategoryItem.where(menu_category_id: @category.id).menu_item
    @menu_items = MenuItem.order(id: :desc)
  end
end
