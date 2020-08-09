class Study < ApplicationRecord
  has_many :trials
  validates :study_name, :direction, presence: true
  validates :direction, inclusion: { in: %w(MAXIMIZE MINIMIZE), message: "%{value} is not a valid input" }

  def destroy_sub
    StudySystemAttribute.destroy_where id
    StudyUserAttribute.destroy_where id
    trials = Trial.where study_id: id
    trials.each do |trial|
      trial.destroy_sub
    end
    destroy
  end
end
