class CreateTrialParams < ActiveRecord::Migration[6.0]
  def change
    create_table :trial_params, {:id => false} do |t|
      t.primary_key :param_id
      t.integer :trial_id, null: false
      t.string :param_name
      t.float :param_value
      t.text :distribution_json
    end
  end
end
