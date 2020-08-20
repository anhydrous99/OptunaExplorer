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

    terminal_output = `sudo ufw allow from #{ip_address_params[:ipaddress]} to any port 3306`
    success = terminal_output.include? 'Rule added'

    if @ip_address.save and success
      redirect_to ip_addresses_path, notice: 'IP Address was successfully created.'
    else
      redirect_to ip_addresses_path, alert: 'Unable to add IP Address.'
    end
  end

  # DELETE /ip_addresses/1
  def destroy
    terminal_output = `sudo ufw delete allow from #{IPAddr.new(@ip_address[:ipaddress], Socket::AF_INET).to_s} to any port 3306`
    success = terminal_output.include? 'Rule deleted'

    if success
      @ip_address.destroy
      redirect_to ip_addresses_url, notice: 'IP Address was successfully destroyed.'
    else
      redirect_to ip_addresses_url, alert: 'Unable to destroy IP Address.'
    end
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
