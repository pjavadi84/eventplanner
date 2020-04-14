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

ActiveRecord::Schema.define(version: 2020_04_14_194139) do

  create_table "bookings", force: :cascade do |t|
    t.integer "total_attending"
    t.datetime "date_booked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.integer "ticket_price"
    t.integer "minimum_age"
    t.string "event_type"
    t.integer "number_of_guests"
    t.datetime "event_date"
    t.integer "user_id", null: false
    t.integer "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_events_on_property_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.integer "ticket_price"
    t.integer "minimum_age"
    t.string "event_type"
    t.datetime "date_created"
    t.integer "maximum_occupancy"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zipcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.integer "age"
    t.integer "budget"
    t.string "event_type"
    t.boolean "host", default: false
    t.boolean "gender", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "events", "properties"
  add_foreign_key "events", "users"
end
