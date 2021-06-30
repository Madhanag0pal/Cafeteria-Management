class HomeController < ApplicationController
  skip_before_action :ensuer_user_logged_in
  before_action :current_user

  def index
  end
end
