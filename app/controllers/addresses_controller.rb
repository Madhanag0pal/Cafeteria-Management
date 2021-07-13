class AddressesController < ApplicationController
  before_action :is_user
  before_action :set_address

  def index
    if @addresses.empty?
      render :new
    end
  end

  def new
  end

  def create
    Address.create(user_id: @current_user.id, name: params[:name], address: params[:address])
    redirect_to addresses_path
  end

  def edit
  end

  def update
    if @addresses.exists?(params[:id])
      @addresses.update(params[:id], name: params[:name], address: params[:address])
    end
    redirect_to addresses_path
  end

  def destroy
    if @addresses.exists?(params[:id])
      @address.destroy
    end
    redirect_to addresses_path
  end

  private

  def set_address
    @addresses = @current_user.addresses
    @address = @addresses.find(params[:id]) if params[:id]
  end

  def is_user
    unless @current_user.customer?
      redirect_to root_path
    end
  end
end
