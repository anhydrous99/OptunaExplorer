FactoryBot.define do
  factory :ip_address do
    user
    ipaddress { IPAddr.new(Faker::Internet.public_ip_v4_address).to_i }
  end
end
