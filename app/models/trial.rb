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
    attributes = %w{trial_id number study_id state value datetime_start datetime_complete}

    CSV.generate headers: true do |csv|
      csv << attributes

      all.each do |trial|
        csv << attributes.map{ |attr| trial.send(attr) }
      end
    end
  end
end
