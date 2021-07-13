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
    if params[:current_password]
      if @current_user.authenticate(params[:current_password])
        if @current_user.update(password: params[:new_password], password_confirmation: params[:password_confirmation])
          redirect_to user_path
        else
          flash["sign-up-error"] = "Password and Password confirmation mismatch"
          redirect_to edit_user_path(id: @current_user.id, password: true)
        end
      else
        flash["sign-up-error"] = "Current password is wrong"
        redirect_to edit_user_path(id: @current_user.id, password: true)
      end
    else
      @current_user.update(name: params[:name], email: params[:email])
      redirect_to user_path
    end
  end

  def destroy
    @current_user.destroy
    @role = nil
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
