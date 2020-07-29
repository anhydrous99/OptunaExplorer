class Trial < ApplicationRecord
  validates :number, :study_id, :state, :datetime_start, presence: true
  validates :state, inclusion: { in: %w(RUNNING COMPLETE PRUNED FAIL),
                                 message: "%{value} is not a valid input" }
end
