require "rails_helper"

RSpec.describe IpAddressesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ip_addresses").to route_to("ip_addresses#index")
    end

    it "routes to #create" do
      expect(post: "/ip_addresses").to route_to("ip_addresses#create")
    end

    it "routes to #destroy" do
      expect(delete: "/ip_addresses/1").to route_to("ip_addresses#destroy", id: "1")
    end
  end
end
