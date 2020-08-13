
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

Then 'I visit the Resend Confirmation Page' do
  visit new_user_confirmation_path
end

Given 'a valid user with username {string} and password {string}' do |username, password|
  @user = User.create! username: username, email: Faker::Internet.email, password: password, confirmed_at: Date.today
end

Given 'a valid user with email {string} and password {string}' do |email, password|
  @user = User.create! username: Faker::Internet.username.gsub("_", "h").gsub(".", "a"), email: email,
                       password: password, confirmed_at: Date.today
end

Given 'I am a valid user and am logged in' do
  @user = User.create! username: Faker::Internet.username.gsub("_", "h").gsub(".", "a"),
                       email: Faker::Internet.email, password: Faker::Internet.password,
                       confirmed_at: Date.today
  visit new_user_session_path
  fill_in 'user_login', with: @user.username
  fill_in 'user_password', with: @user.password
  click_button 'Log in'
  expect(page).to have_content 'Signed in successfully.'
end

When 'I go to the login page' do
  visit new_user_session_path
end

When 'I go to the Forgot your password page' do
  visit new_user_password_path
end

Then "the user's password should have changed" do
  last = @user.encrypted_password
  expect(User.find(@user.id).encrypted_password).to_not eq(last)
end
