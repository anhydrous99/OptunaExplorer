class Trial < ApplicationRecord
  belongs_to :study
  has_many :trial_param
  validates :number, :study_id, :state, :datetime_start, presence: true
  validates :state, inclusion: { in: %w(RUNNING COMPLETE PRUNED FAIL WAITING),
                                 message: "%{value} is not a valid input" }
end
