class CreateTrialValues < ActiveRecord::Migration[6.0]
  def change
    create_table :trial_values, {:id => false} do |t|
      t.primary_key :trial_value_id
      t.integer :trial_id, null: false
      t.integer :step
      t.float :value
    end
  end
end
