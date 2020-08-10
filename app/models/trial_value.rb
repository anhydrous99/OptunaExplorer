class TrialValue < ApplicationRecord
  belongs_to :trial
  validates :trial_id, presence: true

  def self.destroy_where(trial_id)
    values = where(trial_id: trial_id)
    unless values.nil? or values.empty?
      values.delete_all
    end
  end
end
