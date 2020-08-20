require 'rails_helper'

RSpec.describe IpAddress, type: :model do
  describe 'validations' do
    context 'with valid attributes' do
      it 'is valid' do
        user = FactoryBot.create :user
        expect(FactoryBot.build :ip_address, user: user).to be_valid
      end
    end

    context 'without IP Address' do
      it 'is not valid' do
        user = FactoryBot.create :user
        expect(FactoryBot.build :ip_address, user: user, ipaddress: nil).to_not be_valid
      end
    end

    context 'without user' do
      it 'is not valid' do
        expect(FactoryBot.build :ip_address).to_not be_valid
      end
    end
  end
end
