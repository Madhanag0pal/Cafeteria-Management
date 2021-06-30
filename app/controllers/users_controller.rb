class UsersController < ApplicationController
  skip_before_action :ensuer_user_logged_in

  def index
    render plain: User.all.join("\n")
  end

  def show
    render plain: User.find(params[:id])
  end

  def new
  end

  def create
    user = User.new(
      role_id: 3,
      name: params[:name],
      email: params[:email],
      password: params[:password],
    )
    if user.save
      render plain: "User #{user} has created successfuly"
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
