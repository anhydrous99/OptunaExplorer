require 'test_helper'

class TrialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trial = trials(:one)
  end

  test "should get index" do
    get trials_url
    assert_response :success
  end

  test "should get new" do
    get new_trial_url
    assert_response :success
  end

  test "should create trial" do
    assert_difference('Trial.count') do
      post trials_url, params: { trial: { datetime_complete: @trial.datetime_complete, datetime_start: @trial.datetime_start, number: @trial.number, state: @trial.state, study_id: @trial.study_id, trial_id: @trial.trial_id, value: @trial.value } }
    end

    assert_redirected_to trial_url(Trial.last)
  end

  test "should show trial" do
    get trial_url(@trial)
    assert_response :success
  end

  test "should get edit" do
    get edit_trial_url(@trial)
    assert_response :success
  end

  test "should update trial" do
    patch trial_url(@trial), params: { trial: { datetime_complete: @trial.datetime_complete, datetime_start: @trial.datetime_start, number: @trial.number, state: @trial.state, study_id: @trial.study_id, trial_id: @trial.trial_id, value: @trial.value } }
    assert_redirected_to trial_url(@trial)
  end

  test "should destroy trial" do
    assert_difference('Trial.count', -1) do
      delete trial_url(@trial)
    end

    assert_redirected_to trials_url
  end
end
