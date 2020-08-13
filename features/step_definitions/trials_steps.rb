
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
