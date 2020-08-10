FactoryBot.define do
  directions = %w[MAXIMIZE MINIMIZE]
  factory :study do
    study_name { Faker::Name.name }
    direction { directions.sample }
  end

  def study_with_system_attributes(attributes_count: 5)
    study_with_ :study_with_system_attributes, attributes_count
  end

  def study_with_user_attributes(attributes_count: 5)
    study_with_ :study_with_user_attributes, attributes_count
  end

  def study_with_trials(trials_count: 5)
    study_with_ :trials, trials_count
  end

  def study_with_(what, count: 5)
    FactoryBot.create(:study) do |study|
      FactoryBot.create_list(what, count, study: study)
    end
  end
end
