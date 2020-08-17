
Given 'there exists a trial' do
  expect(@study).to_not eq(nil)
  visit new_trial_path
  expect(current_path).to eq(new_trial_path)
  @trial = {
      number: Faker::Number.number(digits: 2),
      study_id: 1,
      state: %w(RUNNING COMPLETE PRUNED FAIL WAITING).sample,
      value: Faker::Number.normal(mean: 50, standard_deviation: 3.5),
      datetime_start: Faker::Date.backward(days: 10),
      datetime_complete: Faker::Date.forward(days: 1)

  }

  fill_in 'trial_number', with: @trial[:number]
  fill_in 'trial_study_id', with: @trial[:study_id]
  fill_in 'trial_state', with: @trial[:state]
  fill_in 'trial_value', with: @trial[:value]
  fill_in 'trial_datetime_start', with: @trial[:datetime_start]
  fill_in 'trial_datetime_complete', with: @trial[:datetime_complete]

  click_button 'Create Trial'
  expect(page).to have_content('Trial was successfully created.')
  visit root_path
end

Then 'I go to the trials page' do
  visit trials_path
end

Then 'I should see the trial' do
  expect(page).to have_content(@trial[:number])
  expect(page).to have_content(@trial[:state])
  expect(page).to have_content(@trial[:value])
  expect(page).to have_content(@trial[:datetime_start])
end

Then 'I should not see the trial' do
  expect(page).to_not have_content(@trial[:number])
  expect(page).to_not have_content(@trial[:state])
  expect(page).to_not have_content(@trial[:value])
  expect(page).to_not have_content(@trial[:datetime_start])
end

Given 'trials with the following values' do |table|
  expect(@study).to_not eq(nil)
  @trials = table.hashes
  @trials.each do |k|
    visit new_trial_path
    expect(current_path).to eq(new_trial_path)
    fill_in 'trial_number', with: k["Number"]
    fill_in 'trial_study_id', with: k["Study"]
    fill_in 'trial_state', with: k["State"]
    fill_in 'trial_value', with: k["Value"]
    fill_in 'trial_datetime_start', with: k["Datetime Start"]
    fill_in 'trial_datetime_complete', with: k["Datetime Complete"]
    click_button 'Create Trial'
    expect(page).to have_content('Trial was successfully created.')
  end
end

And /^I should see "([^"]*)" before "([^"]*)"$/ do |phrase_1, phrase_2|
  first_position = page.body.index(phrase_1)
  second_position = page.body.index(phrase_2)
  expect(first_position).to be < second_position
end

Then 'I click the link with id {string}' do |id|
  click_link id
end

Given 'there exists {int} trials' do |n_trials|
  (1..n_trials).each { step 'there exists a trial' }
end

Then 'I click the first link named {string}' do |link_name|
  click_link(link_name, match: :first)
end

Then 'I should not see {string} in the table' do |text|
  expect(find('.table')).to_not have_content text
end

Then 'I should see {string} in the table' do |text|
  expect(find('.table')).to have_content text
end
