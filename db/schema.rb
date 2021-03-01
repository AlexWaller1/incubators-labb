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

ActiveRecord::Schema.define(version: 2021_03_01_031152) do

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

  create_table "hybrid_minimarts", force: :cascade do |t|
    t.text "visit_log"
    t.integer "hybrid_id"
    t.integer "minimart_id"
    t.index ["hybrid_id"], name: "index_hybrid_minimarts_on_hybrid_id"
    t.index ["minimart_id"], name: "index_hybrid_minimarts_on_minimart_id"
  end

  create_table "hybrid_places", force: :cascade do |t|
    t.integer "hybrid_id"
    t.integer "place_id"
    t.string "address", null: false
    t.index ["hybrid_id"], name: "index_hybrid_places_on_hybrid_id"
    t.index ["place_id"], name: "index_hybrid_places_on_place_id"
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

  create_table "industry_centers", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.text "performance"
    t.string "image"
    t.text "future_goals"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_industry_centers_on_user_id"
  end

  create_table "minimarts", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "sodamachine"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "state"
    t.string "image"
    t.index ["user_id"], name: "index_minimarts_on_user_id"
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_places_on_user_id"
  end

  create_table "robots", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.string "function"
    t.string "personality"
    t.string "image"
    t.text "biography"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_robots_on_user_id"
  end

  create_table "robots_industry_centers", force: :cascade do |t|
    t.integer "robots_id"
    t.integer "industry_centers_id"
    t.string "performance_review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["industry_centers_id"], name: "index_robots_industry_centers_on_industry_centers_id"
    t.index ["robots_id"], name: "index_robots_industry_centers_on_robots_id"
  end

  create_table "skateboarders", force: :cascade do |t|
    t.string "name"
    t.string "experience"
    t.text "favorite_spots"
    t.integer "skatepark_id"
    t.string "image"
    t.index ["skatepark_id"], name: "index_skateboarders_on_skatepark_id"
  end

  create_table "skateparks", force: :cascade do |t|
    t.string "name"
    t.string "town"
    t.string "state"
    t.string "specialty"
    t.integer "user_id"
    t.string "image"
    t.index ["user_id"], name: "index_skateparks_on_user_id"
  end

  create_table "sodas", force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.string "availability"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "minimart_id"
    t.string "image"
    t.index ["minimart_id"], name: "index_sodas_on_minimart_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "HybridMinimarts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "uid", limit: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
