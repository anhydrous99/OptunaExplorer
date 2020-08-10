require 'rails_helper'

RSpec.describe TrialValue, type: :model do
  describe 'validations' do
    context 'without step' do
      it 'is valid' do
        attribute = FactoryBot.create(:trial_value, step: nil)
        expect(attribute).to be_valid
      end
    end
    context 'without value' do
      it 'is valid' do
        attribute = FactoryBot.create(:trial_value, value: nil)
        expect(attribute).to be_valid
      end
    end
    context 'without study_id' do
      it 'is invalid' do
        expect { FactoryBot.create(:trial_value, trial_id: nil) }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end

  describe 'member functions' do
    let!(:trial1) { FactoryBot.create :trial, trial_id: 1 }
    let!(:trial2) { FactoryBot.create :trial, trial_id: 2 }
    let!(:value1) { FactoryBot.create :trial_value, trial_id: 1 }
    let!(:value2) { FactoryBot.create :trial_value, trial_id: 1 }
    let!(:value3) { FactoryBot.create :trial_value, trial_id: 2 }

    context 'when deleting using destroy_where' do
      it 'should delete any attribute with said study_id' do
        expect(trial1.id).to eq(1)
        expect(trial2.id).to eq(2)
        expect(value1.trial_id).to eq(1)
        expect(value2.trial_id).to eq(1)
        expect(value3.trial_id).to eq(2)
        TrialValue.destroy_where value1.trial_id
        expect { value1.reload }.to raise_error ActiveRecord::RecordNotFound
        expect { value2.reload }.to raise_error ActiveRecord::RecordNotFound
        expect { value3.reload }.to_not raise_error
      end
    end
  end
end
