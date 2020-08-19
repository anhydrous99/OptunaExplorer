 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/ip_addresses", type: :request do
  # IpAddress. As you add validations to IpAddress, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      IpAddress.create! valid_attributes
      get ip_addresses_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new IpAddress" do
        expect {
          post ip_addresses_url, params: { ip_address: valid_attributes }
        }.to change(IpAddress, :count).by(1)
      end

      it "redirects to the created ip_address" do
        post ip_addresses_url, params: { ip_address: valid_attributes }
        expect(response).to redirect_to(ip_address_url(IpAddress.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new IpAddress" do
        expect {
          post ip_addresses_url, params: { ip_address: invalid_attributes }
        }.to change(IpAddress, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post ip_addresses_url, params: { ip_address: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested ip_address" do
      ip_address = IpAddress.create! valid_attributes
      expect {
        delete ip_address_url(ip_address)
      }.to change(IpAddress, :count).by(-1)
    end

    it "redirects to the ip_addresses list" do
      ip_address = IpAddress.create! valid_attributes
      delete ip_address_url(ip_address)
      expect(response).to redirect_to(ip_addresses_url)
    end
  end
end
