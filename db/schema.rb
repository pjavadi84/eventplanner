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
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_bookings_on_event_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "event_name"
    t.float "ticket_price"
    t.integer "minimum_age"
    t.string "event_type"
    t.integer "number_of_guests"
    t.date "event_date"
    t.integer "property_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_events_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "property_name"
    t.string "event_type"
    t.date "date_created"
    t.integer "maximum_occupancy"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zipcode"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fullname"
    t.string "email"
    t.string "password_digest"
    t.boolean "host", default: false
    t.string "uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookings", "events"
  add_foreign_key "bookings", "users"
  add_foreign_key "events", "properties"
  add_foreign_key "properties", "users"
end
