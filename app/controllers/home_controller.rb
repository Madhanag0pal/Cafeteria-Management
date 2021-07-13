class HomeController < ApplicationController
  skip_before_action :ensuer_user_logged_in
  before_action :current_user, :set_cartItems   #,:set_orders

  def index
  end

  def search
    unless params[:query].empty?
      query = params[:query].split.map { |part| part.capitalize }.join(" ")
      @menu_items = MenuItem.where("name LIKE ?", "%#{query}%")
    end
  end
end
