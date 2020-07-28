require "application_system_test_case"

class TrialsTest < ApplicationSystemTestCase
  setup do
    @trial = trials(:one)
  end

  test "visiting the index" do
    visit trials_url
    assert_selector "h1", text: "Trials"
  end

  test "creating a Trial" do
    visit trials_url
    click_on "New Trial"

    fill_in "Datetime complete", with: @trial.datetime_complete
    fill_in "Datetime start", with: @trial.datetime_start
    fill_in "Number", with: @trial.number
    fill_in "State", with: @trial.state
    fill_in "Study", with: @trial.study_id
    fill_in "Trial", with: @trial.trial_id
    fill_in "Value", with: @trial.value
    click_on "Create Trial"

    assert_text "Trial was successfully created"
    click_on "Back"
  end

  test "updating a Trial" do
    visit trials_url
    click_on "Edit", match: :first

    fill_in "Datetime complete", with: @trial.datetime_complete
    fill_in "Datetime start", with: @trial.datetime_start
    fill_in "Number", with: @trial.number
    fill_in "State", with: @trial.state
    fill_in "Study", with: @trial.study_id
    fill_in "Trial", with: @trial.trial_id
    fill_in "Value", with: @trial.value
    click_on "Update Trial"

    assert_text "Trial was successfully updated"
    click_on "Back"
  end

  test "destroying a Trial" do
    visit trials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trial was successfully destroyed"
  end
end
