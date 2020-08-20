When 'I go to the IP Address Whitelist page' do
  visit ip_addresses_path
end

When 'I see {string}' do |text|
  expect(page).to have_content text
end