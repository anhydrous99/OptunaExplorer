class IpAddressesController < ApplicationController
  before_action :set_ip_address, only: [:destroy]
  before_action :authenticate_user!
  before_action :ensure_subdomain

  # GET /ip_addresses
  # GET /ip_addresses.json
  def index
    @ip_addresses = IpAddress.where user_id: current_user.id
  end

  # GET /ip_addresses/new
  def new
    @ip_address = IpAddress.new user_id: current_user.id
  end

  # POST /ip_addresses
  # POST /ip_addresses.json
  def create
    @ip_address = IpAddress.new(user_id: current_user.id, ip_address: ip_address_params['ip_address'])

    respond_to do |format|
      if @ip_address.save
        format.html { redirect_to ip_addresses_path, notice: 'Ip address was successfully created.' }
        format.json { render :index, status: :created }
      else
        format.html { render :new }
        format.json { render json: @ip_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ip_addresses/1
  # DELETE /ip_addresses/1.json
  def destroy
    @ip_address.destroy
    respond_to do |format|
      format.html { redirect_to ip_addresses_url, notice: 'Ip address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ip_address
      @ip_address = IpAddress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ip_address_params
      params.require(:ip_address).permit(:user_id, :ip_address)
    end

    def ensure_subdomain
      if request.subdomain != 'www'
        redirect_to subdomain: 'www'
      end
    end
end
