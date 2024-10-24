# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_24_135210) do
  create_table "answers", force: :cascade do |t|
    t.integer "response_id", null: false
    t.integer "form_field_id", null: false
    t.string "response_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_field_id"], name: "index_answers_on_form_field_id"
    t.index ["response_id"], name: "index_answers_on_response_id"
  end

  create_table "form_field_options", force: :cascade do |t|
    t.string "option"
    t.integer "form_field_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_field_id"], name: "index_form_field_options_on_form_field_id"
  end

  create_table "form_fields", force: :cascade do |t|
    t.integer "form_id", null: false
    t.text "field_text"
    t.integer "field_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "multiple_answers"
    t.index ["form_id"], name: "index_form_fields_on_form_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_responses_on_form_id"
  end

  add_foreign_key "answers", "form_fields"
  add_foreign_key "answers", "responses"
  add_foreign_key "form_field_options", "form_fields"
  add_foreign_key "form_fields", "forms"
  add_foreign_key "responses", "forms"
end
