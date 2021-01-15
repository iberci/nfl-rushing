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

ActiveRecord::Schema.define(version: 2021_01_14_230707) do

  create_table "rusher_names", force: :cascade do |t|
    t.integer "ordinal", default: 0, null: false
    t.string "name", null: false
    t.string "index_name", null: false
    t.integer "rusher_id"
    t.index ["index_name"], name: "index_rusher_names_on_index_name"
    t.index ["rusher_id"], name: "index_rusher_names_on_rusher_id"
  end

  create_table "rusher_versions", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "error_at"
    t.text "result"
    t.string "sha256"
    t.string "version", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rushers", force: :cascade do |t|
    t.string "team", null: false
    t.string "pos", null: false
    t.integer "att", default: 0, null: false
    t.integer "att_g", default: 0, null: false
    t.integer "yds", default: 0, null: false
    t.float "avg", default: 0.0, null: false
    t.float "yds_g", default: 0.0, null: false
    t.integer "td", default: 0, null: false
    t.integer "lng", default: 0, null: false
    t.integer "first_downs", default: 0, null: false
    t.float "first_down_p", default: 0.0, null: false
    t.integer "plus_20", default: 0, null: false
    t.integer "plus_40", default: 0, null: false
    t.integer "fumbles", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rusher_version_id", null: false
  end

  add_foreign_key "rushers", "rusher_versions", on_delete: :cascade
end
