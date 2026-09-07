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

ActiveRecord::Schema[8.1].define(version: 2026_09_07_142417) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bike_models", force: :cascade do |t|
    t.string "brand", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bikes", force: :cascade do |t|
    t.bigint "bike_model_id", null: false
    t.string "colour"
    t.datetime "created_at", null: false
    t.bigint "customer_id", null: false
    t.string "serial_number"
    t.datetime "updated_at", null: false
    t.index ["bike_model_id"], name: "index_bikes_on_bike_model_id"
    t.index ["customer_id"], name: "index_bikes_on_customer_id"
    t.index ["serial_number"], name: "index_bikes_on_serial_number", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.string "phone", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repair_services", force: :cascade do |t|
    t.decimal "charged_price", precision: 10, scale: 2, null: false
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.bigint "mechanic_id"
    t.bigint "repair_id", null: false
    t.bigint "service_id", null: false
    t.datetime "updated_at", null: false
    t.index ["mechanic_id"], name: "index_repair_services_on_mechanic_id"
    t.index ["repair_id"], name: "index_repair_services_on_repair_id"
    t.index ["service_id"], name: "index_repair_services_on_service_id"
  end

  create_table "repairs", force: :cascade do |t|
    t.bigint "bike_id", null: false
    t.datetime "collected_at"
    t.datetime "created_at", null: false
    t.date "promised_on", null: false
    t.datetime "quote_answered_at"
    t.bigint "quote_answered_by_id"
    t.datetime "received_at", null: false
    t.bigint "received_by_id", null: false
    t.string "state", default: "received", null: false
    t.datetime "updated_at", null: false
    t.index ["bike_id"], name: "index_repairs_on_bike_id"
    t.index ["quote_answered_by_id"], name: "index_repairs_on_quote_answered_by_id"
    t.index ["received_by_id"], name: "index_repairs_on_received_by_id"
  end

  create_table "services", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_services_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.string "role", null: false
    t.datetime "updated_at", null: false
  end
end
