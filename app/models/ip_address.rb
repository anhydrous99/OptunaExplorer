require 'resolv'

class IpAddress < ApplicationRecord
  belongs_to :user
  validates :ipaddress, presence: true, uniqueness: true
  validates :user_id, presence: true
end
