class Study < ApplicationRecord
  validates :study_name, :direction, presence: true
  validates :direction, inclusion: { in: %w(MAXIMIZE MINIMIZE), message: "%{value} is not a valid input" }

  def get_study_id_from_name(name)
    Study.select(:study_id).where(name: name).LIMIT(1)
  end
end
