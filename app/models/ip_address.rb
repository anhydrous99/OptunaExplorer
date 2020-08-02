class IpAddress < ApplicationRecord
  validates_uniqueness_of :ip_address
end
