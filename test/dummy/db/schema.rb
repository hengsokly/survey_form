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

ActiveRecord::Schema.define(version: 2020_08_28_084244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "survey_form_field_options", force: :cascade do |t|
    t.integer "field_id"
    t.string "name"
    t.string "value"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "survey_form_fields", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "type"
    t.text "description"
    t.integer "display_order"
    t.integer "section_id"
    t.integer "form_id"
    t.integer "mapping_field_id"
    t.string "mapping_field_type"
    t.boolean "default", default: false
    t.boolean "entry_able", default: true
    t.boolean "color_required", default: false
    t.boolean "tracingable", default: false
    t.boolean "required"
    t.text "validations"
    t.string "relevant"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "survey_form_forms", force: :cascade do |t|
    t.string "name"
    t.integer "display_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "survey_form_sections", force: :cascade do |t|
    t.string "name"
    t.integer "form_id"
    t.integer "display_order"
    t.boolean "default", default: false
    t.boolean "display", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
