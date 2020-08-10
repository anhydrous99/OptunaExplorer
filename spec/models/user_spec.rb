require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'with valid attributes' do
      it 'is valid' do
        user = FactoryBot.create :user
        expect(user).to be_valid
      end
    end

    context 'without username' do
      it 'is not valid' do
        expect { FactoryBot.create :user, username: nil }.to raise_error ActiveRecord::RecordInvalid
      end
    end

    context 'with non-unique usernames' do
      it 'is not valid' do
        user1 = FactoryBot.create :user
        expect { FactoryBot.create :user, username: user1.username }.to raise_error ActiveRecord::RecordInvalid
      end

      it 'is not valid with different cases and same letters' do
        user1 = FactoryBot.create :user
        expect { FactoryBot.create :user, username: user1.username.upcase }.to raise_error ActiveRecord::RecordInvalid
      end
    end

    it 'is not valid with an incorrect format' do
      expect { FactoryBot.create :user, username: "ao$weuf31b" }.to raise_error ActiveRecord::RecordInvalid
    end

    it 'is not valid with the username containing character _' do
      expect { FactoryBot.create :user, username: "aownais_ion" }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
