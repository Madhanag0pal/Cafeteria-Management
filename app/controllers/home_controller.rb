class HomeController < ApplicationController
  skip_before_action :ensuer_user_logged_in
  before_action :current_user

  def index
    if params[:search]
      redirect_to "/##{params[:search]}"
    end
  end
end
