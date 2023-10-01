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

ActiveRecord::Schema[7.0].define(version: 2023_09_30_224542) do
  create_table "scrape_targets", force: :cascade do |t|
    t.integer "target_id", null: false
    t.integer "scrape_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scrape_id"], name: "index_scrape_targets_on_scrape_id"
    t.index ["target_id", "scrape_id"], name: "index_scrape_targets_on_target_id_and_scrape_id", unique: true
    t.index ["target_id"], name: "index_scrape_targets_on_target_id"
  end

  create_table "scrapes", force: :cascade do |t|
    t.integer "service_id", null: false
    t.integer "stack_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_scrapes_on_service_id"
    t.index ["stack_id"], name: "index_scrapes_on_stack_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "port"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stacks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "targets", force: :cascade do |t|
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "scrape_targets", "scrapes"
  add_foreign_key "scrape_targets", "targets"
  add_foreign_key "scrapes", "services"
  add_foreign_key "scrapes", "stacks"
end
