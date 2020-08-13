When 'I go to the studies page' do
  visit studies_path
  expect(current_path).to eq(studies_path)
end

Then 'I click the link {string}' do |link_name|
  click_link link_name
end

Then 'I select {string} from {string}' do |option, select_name|
  select option, from: select_name
end

Then "I should be in the user's subdomain" do
  expect(URI.parse(current_url).hostname.split('.')[0]).to eq(@user.username)
end

Then 'the study should have been successfully created' do
  expect(page).to have_content('Study was successfully created.')
end

Then 'I should be in the trials page' do
  expect(current_path).to include('trials')
end

Then 'I create a study' do
  visit studies_path
  click_link 'Create Study'
  @study = {username: Faker::Internet.username, direction: %w(MAXIMIZE MINIMIZE).sample}
  fill_in "study_study_name", with: @study[:username]
  select @study[:direction], from: 'study_direction'
  click_button 'Create Study'
  visit root_path
end

Given 'there exists a study' do
  step 'I create a study'
end

Then 'I should see said study in the table' do
  expect(page).to have_content(@study[:username])
end

Then 'I should see my mysql url' do
  expect(page).to have_content("mysql://#{@user.username}:\"your password without quotes\"@161.35.126.61/#{@user.username}")
end