class UsersController < ApplicationController
  skip_before_action :ensuer_user_logged_in, only: [:create, :new]
  before_action :current_user, only: [:create, :new]

  def index
    unless @role.admin?
      render :show
    end
  end

  def new
  end

  def edit
    user = @role.admin? ? User.find(params[:id]) : @current_user
  end

  def create
    role = 3
    if @role.admin?
      role = params[:role]
    end
    user = User.new(
      role_id: role,
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if user.save
      if @role.customer?
        session[:current_user_id] = user.id
      end
      redirect_to users_path
    else
      flash["sign-up-error"] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def update
    user = @role.admin? ? User.find(params[:id]) : @current_user

    if params[:current_password]
      if user.authenticate(params[:current_password])
        if user.update(password: params[:new_password], password_confirmation: params[:password_confirmation])
          redirect_to user_path
        else
          flash["sign-up-error"] = user.errors.full_messages.join(", ")
          redirect_to edit_user_path(id: user.id, password: true)
        end
      else
        flash["sign-up-error"] = "Current password is wrong"
        redirect_to edit_user_path(id: user.id, password: true)
      end
    elsif @role.admin? && params[:new_password]
      if user.update(password: params[:new_password], password_confirmation: params[:password_confirmation])
        redirect_to users_path
      else
        flash["sign-up-error"] = user.errors.full_messages.join(", ")
        redirect_to edit_user_path(id: user.id, password: true)
      end
    else
      if user.update(name: params[:name], email: params[:email])
        if params[:editable]
          redirect_to users_path
        else
          redirect_to user_path
        end
      else
        flash["sign-up-error"] = user.errors.full_messages.join(", ")
        redirect_to edit_user_path(id: user.id)
      end
    end
  end

  def destroy
    user = @role.admin? ? User.find(params[:id]) : @current_user
    unless user.id == 1
      user.destroy
    end
    if @role.customer?
      session[:current_user_id] = nil
    end
    redirect_to users_path
  end
end
