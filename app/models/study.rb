class Study < ApplicationRecord
  has_many :trials
  validates :study_name, :direction, presence: true
  validates :direction, inclusion: { in: %w(MAXIMIZE MINIMIZE), message: "%{value} is not a valid input" }

  def get_study_id_from_name(name)
    Study.select(:study_id).where(name: name).limit(1)
  end

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
