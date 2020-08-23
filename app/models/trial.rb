require 'csv'

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

  def self.to_csv
    attributes = %w{trial_id number study_id study state value datetime_start datetime_complete}

    CSV.generate headers: true do |csv|
      csv << attributes

      all.each do |trial|
        csv << [trial.trial_id, trial.number, trial.study_id, trial.study.study_name, trial.state, trial.value,
                trial.datetime_start, trial.datetime_complete]
      end
    end
  end
end
