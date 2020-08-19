class IpAddressesController < ApplicationController
  before_action :ensure_subdomain, :authenticate_user!
  before_action :set_ip_address, only: [:destroy]

  # GET /ip_addresses
  def index
    @ip_addresses = IpAddress.where user_id: current_user.id
    @ip_address = IpAddress.new
  end

  # POST /ip_addresses
  def create
    @ip_address = IpAddress.new(ipaddress: IPAddr.new(ip_address_params[:ipaddress]).to_i, user_id: current_user.id)

    if @ip_address.save
      redirect_to ip_addresses_path, notice: 'Ip Address was successfully created.'
    else
      render ip_address_path
    end
  end

  # DELETE /ip_addresses/1
  def destroy
    @ip_address.destroy
    redirect_to ip_addresses_url, notice: 'Ip Address was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ip_address
    @ip_address = IpAddress.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ip_address_params
    params.require(:ip_address).permit(:ipaddress)
  end
end
