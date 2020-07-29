class CreateStudySystemAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :study_system_attributes, {:id => false} do |t|
      t.primary_key :study_system_attribute_id
      t.integer :study_id, null: false
      t.string :key
      t.text :value_json
    end
  end
end
