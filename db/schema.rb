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

ActiveRecord::Schema[7.1].define(version: 2024_03_05_183252) do
  create_table "meds", force: :cascade do |t|
    t.string "name"
    t.integer "dosage"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.string "breed"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "frequency"
    t.string "duration"
    t.date "date_prescribed"
    t.integer "pet_id", null: false
    t.integer "vet_id", null: false
    t.integer "med_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["med_id"], name: "index_prescriptions_on_med_id"
    t.index ["pet_id"], name: "index_prescriptions_on_pet_id"
    t.index ["vet_id"], name: "index_prescriptions_on_vet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
  end

  create_table "vets", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pets", "users"
  add_foreign_key "prescriptions", "meds"
  add_foreign_key "prescriptions", "pets"
  add_foreign_key "prescriptions", "vets"
end
