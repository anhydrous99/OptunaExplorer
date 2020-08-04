class Trial < ApplicationRecord
  belongs_to :study
  has_many :trial_param
  validates :number, :study_id, :state, :datetime_start, presence: true
  validates :state, inclusion: { in: %w(RUNNING COMPLETE PRUNED FAIL WAITING),
                                 message: "%{value} is not a valid input" }

  def destroy_sub
    TrialParam.destroy_where id
    TrialSystemAttribute.destroy_where id
    TrialUserAttribute.destroy_where id
    TrialValue.destroy_where id
    destroy
  end
end
