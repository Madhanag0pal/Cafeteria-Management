class HomeController < ApplicationController
  skip_before_action :ensuer_user_logged_in

  def index
    if current_user
      redirect_to menu_path
    end
  end
end
