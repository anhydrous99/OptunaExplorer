class CreateTrialSystemAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :trial_system_attributes, {:id => false} do |t|
      t.primary_key :trial_system_attribute_id
      t.integer :trial_id, null: false
      t.string :key
      t.text :value_json
    end
  end
end
