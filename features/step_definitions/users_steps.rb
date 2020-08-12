
Given 'I am not authenticated' do
  visit destroy_user_session_path
end

When 'I go to register' do
  visit new_user_registration_path
end

When 'I fill in {string} with {string}' do |field_id, value|
  fill_in field_id, with: value
end

When 'I press {string}' do |button_name|
  click_button button_name
end

Then 'I should see {string}' do |text|
  expect(page).to have_content text
end