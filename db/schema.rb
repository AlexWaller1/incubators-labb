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

ActiveRecord::Schema.define(version: 2021_01_31_003929) do

  create_table "friends", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.string "personality"
    t.text "biography"
    t.string "image"
    t.integer "hybrid_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hybrid_id"], name: "index_friends_on_hybrid_id"
  end

  create_table "hybrids", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.string "personality"
    t.text "biography"
    t.string "image"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_hybrids_on_user_id"
  end

  create_table "motorhomes", force: :cascade do |t|
    t.string "model"
    t.string "image"
    t.integer "year"
    t.text "features"
    t.string "mileage"
    t.text "history"
    t.integer "hybrid_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hybrid_id"], name: "index_motorhomes_on_hybrid_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "atmosphere"
    t.text "status"
    t.string "image"
    t.integer "hybrid_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hybrid_id"], name: "index_places_on_hybrid_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "uid", limit: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
