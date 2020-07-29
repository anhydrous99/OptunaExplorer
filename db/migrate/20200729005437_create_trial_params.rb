class CreateTrialParams < ActiveRecord::Migration[6.0]
  def change
    create_table :trial_params, {:id => false} do |t|
      t.primary_key :param_id
      t.references :trial, null: false, foreign_key: true
      t.string :param_name, {unique: true}
      t.float :param_value
      t.text :distribution_json
    end
  end
end
