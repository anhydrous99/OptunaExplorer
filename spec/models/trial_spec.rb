require 'rails_helper'

RSpec.describe Trial, type: :model do
  describe 'validations' do
    context 'is valid' do
      it 'with valid attributes' do
        parent_study = FactoryBot.create :study
        expect(FactoryBot.build(:trial, study: parent_study)).to be_valid
      end
    end
    context 'is not valid' do
      it 'without number' do
        parent_study = FactoryBot.create :study
        expect(FactoryBot.build(:trial, study: parent_study, number: nil)).to_not be_valid
      end
      it 'without study_id' do
        expect(FactoryBot.build(:trial)).to_not be_valid
      end
      it 'without datetime_start' do
        parent_study = FactoryBot.create :study
        expect(FactoryBot.build(:trial, study: parent_study, datetime_start: nil)).to_not be_valid
      end
    end
  end

  describe 'member functions' do
    let!(:study) { FactoryBot.create :study, study_id: 1 }
    let!(:trial) { FactoryBot.create :trial, study_id: 1 }
    it 'successfully deletes sub items' do
      expect(trial.study_id).to eq(1)
      trial.destroy_sub
      expect { trial.reload }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
