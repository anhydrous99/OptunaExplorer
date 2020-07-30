# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_29_193050) do

  create_table "studies", primary_key: "study_id", force: :cascade do |t|
    t.string "study_name", null: false
    t.string "direction", null: false
  end

  create_table "study_system_attributes", primary_key: "study_system_attribute_id", force: :cascade do |t|
    t.integer "study_id", null: false
    t.string "key"
    t.text "value_json"
  end

  create_table "study_user_attributes", primary_key: "study_user_attribute_id", force: :cascade do |t|
    t.integer "study_id", null: false
    t.string "key"
    t.text "value_json"
  end

  create_table "trial_params", primary_key: "param_id", force: :cascade do |t|
    t.integer "trial_id", null: false
    t.string "param_name"
    t.float "param_value"
    t.text "distribution_json"
  end

  create_table "trial_system_attributes", primary_key: "trial_system_attribute_id", force: :cascade do |t|
    t.integer "trial_id", null: false
    t.string "key"
    t.text "value_json"
  end

  create_table "trial_user_attributes", primary_key: "trial_user_attribute_id", force: :cascade do |t|
    t.integer "trial_id", null: false
    t.string "key"
    t.text "value_json"
  end

  create_table "trial_values", primary_key: "trial_value_id", force: :cascade do |t|
    t.integer "trial_id", null: false
    t.integer "step"
    t.float "value"
  end

  create_table "trials", primary_key: "trial_id", force: :cascade do |t|
    t.integer "number"
    t.integer "study_id", null: false
    t.string "state"
    t.float "value"
    t.datetime "datetime_start"
    t.datetime "datetime_complete"
  end

end
