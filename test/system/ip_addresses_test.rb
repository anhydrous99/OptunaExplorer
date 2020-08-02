require "application_system_test_case"

class IpAddressesTest < ApplicationSystemTestCase
  setup do
    @ip_address = ip_addresses(:one)
  end

  test "visiting the index" do
    visit ip_addresses_url
    assert_selector "h1", text: "Ip Addresses"
  end

  test "creating a Ip address" do
    visit ip_addresses_url
    click_on "New Ip Address"

    fill_in "Ip address", with: @ip_address.ip_address
    fill_in "User", with: @ip_address.user_id
    click_on "Create Ip address"

    assert_text "Ip address was successfully created"
    click_on "Back"
  end

  test "updating a Ip address" do
    visit ip_addresses_url
    click_on "Edit", match: :first

    fill_in "Ip address", with: @ip_address.ip_address
    fill_in "User", with: @ip_address.user_id
    click_on "Update Ip address"

    assert_text "Ip address was successfully updated"
    click_on "Back"
  end

  test "destroying a Ip address" do
    visit ip_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ip address was successfully destroyed"
  end
end
