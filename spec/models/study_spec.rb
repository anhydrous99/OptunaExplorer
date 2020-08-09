require 'rails_helper'

RSpec.describe Study, type: :model do
  subject { Study.new }

  it 'is valid with valid attributes MAXIMIZE' do
    subject.study_id = 1
    subject.study_name = "Anything"
    subject.direction = "MAXIMIZE"
    expect(subject).to be_valid
  end

  it 'is valid with valid attributes MINIMIZE' do
    subject.study_id = 1
    subject.study_name = "Anything"
    subject.direction = "MINIMIZE"
    expect(subject).to be_valid
  end

  it 'is not valid without a study_name' do
    subject.study_id = 1
    subject.study_name = nil
    subject.direction = "MINIMIZE"
    expect(subject).to_not be_valid
  end

  it 'is not valid without a direction' do
    subject.study_id = 1
    subject.study_name = "Anything"
    subject.direction = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with an invalid direction' do
    subject.study_id = 1
    subject.study_name = "Anything"
    subject.direction = "Something"
    expect(subject).to_not be_valid
  end

  it 'it should destroy all entries with foreign key pointing to study' do
    subject.study_id = 1
    subject.study_name = "Anything"
    subject.direction = "MINIMIZE"
    subject.destroy_sub
    expect { subject.reload }.to raise_error ActiveRecord::RecordNotFound
  end
end
