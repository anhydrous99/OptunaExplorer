class TrialSystemAttribute < ApplicationRecord
  belongs_to :trial
  validates :trial_id, presence: true

  def self.destroy_where(trial_id)
    params = where(trial_id: trial_id)
    unless params.nil? or params.empty?
      params.delete_all
    end
  end
end
