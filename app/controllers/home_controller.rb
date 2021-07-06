class HomeController < ApplicationController
  skip_before_action :ensuer_user_logged_in
  before_action :current_user, :set_cartItems   #,:set_orders

  def index
    if params[:search]
      redirect_to "/##{params[:search]}"
    end
  end
end
