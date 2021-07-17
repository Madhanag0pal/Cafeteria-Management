class AddressesController < ApplicationController
  before_action :is_user, :set_address

  def index
    if @addresses.empty?
      render :new
    end
  end

  def new
  end

  def create
    address = Address.new(user_id: @current_user.id, name: params[:name], address: params[:address])
    if @addresses.exists?(name: params[:name])
      flash["address-error"] = "#{params[:name]} address is already exist"
      redirect_to new_address_path
    elsif address.save
      redirect_to addresses_path
    else
      flash["address-error"] = address.errors.full_messages.join(", ")
      redirect_to new_address_path
    end
  end

  def edit
  end

  def update
    if @addresses.exists?(name: params[:name]) && @address.name != params[:name]
      flash["address-error"] = "#{params[:name]} address is already exist"
      redirect_to edit_address_path(id: @address.id)
    elsif @address.update(name: params[:name], address: params[:address])
      redirect_to addresses_path
    else
      flash["address-error"] = @address.errors.full_messages.join(", ")
      redirect_to edit_address_path(id: @address.id)
    end
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
