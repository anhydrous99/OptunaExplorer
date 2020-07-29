class CreateTrials < ActiveRecord::Migration[6.0]
  def change
    create_table :trials, {:id => false} do |t|
      t.primary_key :trial_id
      t.integer :number
      t.references :study, null: false, foreign_key: true
      t.string :state
      t.float :value
      t.datetime :datetime_start
      t.datetime :datetime_complete
    end
  end
end
