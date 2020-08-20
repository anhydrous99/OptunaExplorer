Feature: Adding and Delete IP Addresses from Whitelist
  Tests the creation and deletion of IP Addresses to the whitelist

Scenario: Adding and Deleting an IP Address
  Given I am a valid user and am logged in
  When I go to the IP Address Whitelist page
  And I see "IP Address Whitelist"
  Then I fill in "ip_address_ipaddress" with "192.168.2.1"
  And I press "Add IP Address"
  And I should see "IP Address was successfully created."
  And I click the first link named "Delete"
  And I should see "IP Address was successfully destroyed."

Scenario: Visiting IP Address Whitelist Page
  Given I am a valid user and am logged in
  When I click the link "Whitelist"
  Then I should see "IP Address Whitelist"
