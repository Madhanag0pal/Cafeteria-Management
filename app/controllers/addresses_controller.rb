class AddressesController < ApplicationController
  before_action :is_user
  before_action :set_address, only: [:edit, :update, :destroy]

  def index
    @addresses = @current_user.addresses
  end

  def new
  end

  def create
    Address.create(user_id: @current_user.id, name: params[:name], address: params[:address])
    redirect_to root_path
  end

  def edit
  end

  def update
    Address.update(params[:id], name: params[:name], address: params[:address])
    redirect_to addresses_path
  end

  def destroy
    @address.destroy
    redirect_to addresses_path
  end

  private

  def set_address
    @address = @current_user.addresses.find(params[:id])
  end

  def is_user
    unless @current_user.role.id == 3
      redirect_to root_path
    end
  end
end
