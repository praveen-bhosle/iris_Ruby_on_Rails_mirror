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

ActiveRecord::Schema[7.2].define(version: 2024_11_07_105913) do
  create_table "add_form_id_to_sections", force: :cascade do |t|
    t.integer "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_add_form_id_to_sections_on_form_id"
  end

  create_table "answers", force: :cascade do |t|
    t.integer "response_id", null: false
    t.integer "form_field_id", null: false
    t.string "response_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "response_radio_choice"
    t.string "response_checkbox_choices"
    t.index ["form_field_id"], name: "index_answers_on_form_field_id"
    t.index ["response_id"], name: "index_answers_on_response_id"
  end

  create_table "form_field_options", force: :cascade do |t|
    t.integer "form_field_id", null: false
    t.text "option"
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
    t.boolean "multiple_options"
    t.integer "section_id"
    t.index ["form_id"], name: "index_form_fields_on_form_id"
    t.index ["section_id"], name: "index_form_fields_on_section_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.boolean "public", default: false
    t.index ["user_id"], name: "index_forms_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "section_id"
    t.index ["form_id"], name: "index_responses_on_form_id"
    t.index ["section_id"], name: "index_responses_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "form_id", null: false
    t.index ["form_id"], name: "index_sections_on_form_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "superuser", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "add_form_id_to_sections", "forms"
  add_foreign_key "answers", "form_fields"
  add_foreign_key "answers", "responses"
  add_foreign_key "form_field_options", "form_fields"
  add_foreign_key "form_fields", "forms"
  add_foreign_key "form_fields", "sections"
  add_foreign_key "forms", "users"
  add_foreign_key "responses", "forms"
  add_foreign_key "responses", "sections"
  add_foreign_key "sections", "forms"
end
