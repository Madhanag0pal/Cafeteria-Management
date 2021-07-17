class MenuCategoriesController < ApplicationController
  before_action :is_admin
  before_action :set_menu_categoy, only: %i[ show edit update destroy ]

  def index
  end

  def create
    MenuCategory.create(name: params[:name])
    redirect_to root_path
  end

  def edit
  end

  def update
    if params[:name]
      @menu_categoy.update(name: params[:name])
    else
      @menu_categoy.update(status: params[:status])
    end
    redirect_to root_path
  end

  def destroy
    @menu_categoy.destroy
    redirect_to root_path
  end

  private

  def set_menu_categoy
    @menu_categoy = MenuCategory.find(params[:id])
  end
end
