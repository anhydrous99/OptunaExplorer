require 'rails_helper'

RSpec.describe TrialParam, type: :model do
  describe 'validations' do
    context 'is valid' do
      it 'is valid with valid parameters' do
        trial = FactoryBot.create(:trial)
        param = FactoryBot.build(:trial_param, trial: trial)
        expect(param).to be_valid
      end
    end

    context 'is not valid' do
      it 'is not valid without a trial' do
        expect(FactoryBot.build(:trial_param)).to_not be_valid
      end
    end
  end

  describe 'member function' do
    let!(:trial1) { FactoryBot.create :trial, trial_id: 1 }
    let!(:trial2) { FactoryBot.create :trial, trial_id: 2 }
    let!(:trial_param1) { FactoryBot.create :trial_param, trial_id: 1 }
    let!(:trial_param2) { FactoryBot.create :trial_param, trial_id: 1 }
    let!(:trial_param3) { FactoryBot.create :trial_param, trial_id: 2 }

    it 'destroy_where destroys all params with the same trial_id' do
      expect(trial_param1).to be_valid
      expect(trial_param2).to be_valid
      expect(trial_param3).to be_valid
      TrialParam.destroy_where trial_param1.trial_id
      expect { trial_param1.reload }.to raise_error ActiveRecord::RecordNotFound
      expect { trial_param2.reload }.to raise_error ActiveRecord::RecordNotFound
      expect { trial_param3.reload }.to_not raise_error
    end
  end
end
