class UsersController < ApplicationController
  skip_before_action :ensuer_user_logged_in, only: [:create, :new]

  def index
  end

  def new
  end

  def create
    user = User.new(
      role_id: 3,
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if user.save
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      flash["sign-up-error"] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def update
  end

  def destroy
    deletedUser = User.destroy(params[:id])
    render plain: "User #{deletedUser} deleted successfully"
  end
end
