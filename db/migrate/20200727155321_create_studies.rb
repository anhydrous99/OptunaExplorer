class CreateStudies < ActiveRecord::Migration[6.0]
  def change
    create_table :studies, {:id => false} do |t|
      t.primary_key :study_id
      t.string :study_name
      t.string :direction
    end
  end
end
