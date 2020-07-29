require 'test_helper'

class TrialTest < ActiveSupport::TestCase
  test 'valid trial' do
    trial = Trial.new number: 0, study_id: 0, state: 'COMPLETE', datetime_start: '2020-04-25 06:05:48 UTC'
    assert trial.valid?
  end

  test 'invalid without number' do
    trial = Trial.new study_id: 0, state: 'COMPLETE', datetime_start: '2020-04-25 06:05:48 UTC'
    refute trial.valid?
    assert_not_nil trial.errors[:number]
  end

  test 'invalid without study' do
    trial = Trial.new number: 0, state: 'COMPLETE', datetime_start: '2020-04-25 06:05:48 UTC'
    refute trial.valid?
    assert_not_nil trial.errors[:study_id]
  end

  test 'invalid without state' do
    trial = Trial.new number: 0, study_id: 0, datetime_start: '2020-04-25 06:05:48 UTC'
    refute trial.valid?
    assert_not_nil trial.errors[:state]
  end

  test 'invalid without datetime_start' do
    trial = Trial.new number: 0, study_id: 0, state: 'COMPLETE'
    refute trial.valid?
    assert_not_nil trial.errors[:datetime_start]
  end

  test 'invalid state invalidates trial' do
    trial = Trial.new number: 0, study_id: 0, state: 'ASDF', datetime_start: '2020-04-25 06:05:48 UTC'
    refute trial.valid?
    assert_not_nil trial.errors[:state]
  end
end
