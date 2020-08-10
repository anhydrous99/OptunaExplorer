require 'rails_helper'

RSpec.describe TrialSystemAttribute, type: :model do
  describe 'validations' do
    context 'without key' do
      it 'is valid' do
        attribute = FactoryBot.create(:trial_system_attribute, key: nil)
        expect(attribute).to be_valid
      end
    end
    context 'without value' do
      it 'is valid' do
        attribute = FactoryBot.create(:trial_system_attribute, value_json: nil)
        expect(attribute).to be_valid
      end
    end
    context 'without study_id' do
      it 'is invalid' do
        expect { FactoryBot.create(:trial_system_attribute, trial_id: nil) }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end

  describe 'member functions' do
    let!(:trial1) { FactoryBot.create :trial, trial_id: 1 }
    let!(:trial2) { FactoryBot.create :trial, trial_id: 2 }
    let!(:attribute1) { FactoryBot.create :trial_system_attribute, trial_id: 1 }
    let!(:attribute2) { FactoryBot.create :trial_system_attribute, trial_id: 1 }
    let!(:attribute3) { FactoryBot.create :trial_system_attribute, trial_id: 2 }

    context 'when deleting using destroy_where' do
      it 'should delete any attribute with said study_id' do
        expect(trial1.id).to eq(1)
        expect(trial2.id).to eq(2)
        expect(attribute1.trial_id).to eq(1)
        expect(attribute2.trial_id).to eq(1)
        expect(attribute3.trial_id).to eq(2)
        TrialSystemAttribute.destroy_where attribute1.trial_id
        expect { attribute1.reload }.to raise_error ActiveRecord::RecordNotFound
        expect { attribute2.reload }.to raise_error ActiveRecord::RecordNotFound
        expect { attribute3.reload }.to_not raise_error
      end
    end
  end
end
