class StudySystemAttribute < ApplicationRecord
  belongs_to :study

  def self.destroy_where(study_id)
    attributes = where(study_id: study_id)
    unless attributes.nil? or attributes.empty?
      attributes.delete_all
    end
  end
end
