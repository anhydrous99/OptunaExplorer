require 'test_helper'

class StudyTest < ActiveSupport::TestCase
  test 'valid study' do
    study = Study.new study_name: 'ASDF', direction: 'MINIMIZE'
    assert study.valid?
  end

  test 'invalid without study name' do
    study = Study.new direction: 'MAXIMIZE'
    refute study.valid?
    assert_not_nil study.errors[:study_name]
  end

  test 'invalid without direction' do
    study = Study.new study_name: 'ASDF'
    refute study.valid?
    assert_not_nil study.errors[:direction]
  end

  test 'invalid direction invalidates study' do
    study = Study.new study_name: 'ASDF', direction: 'ASDF'
    refute study.valid?
    assert_not_nil study.errors[:study_name]
  end
end
