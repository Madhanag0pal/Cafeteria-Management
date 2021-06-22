class UsersController < ApplicationController
  def index
    render plain: User.all.join("\n")
  end

  def show
    render plain: User.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
