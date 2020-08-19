require 'rails_helper'

RSpec.describe "ip_addresses/index", type: :view do
  before(:each) do
    assign(:ip_addresses, [
      IpAddress.create!(
        user: nil,
        ipaddress: 2
      ),
      IpAddress.create!(
        user: nil,
        ipaddress: 2
      )
    ])
  end

  it "renders a list of ip_addresses" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
