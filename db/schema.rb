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

ActiveRecord::Schema.define(version: 2020_10_28_004708) do

  create_table "film_people", force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_film_people_on_film_id"
    t.index ["person_id"], name: "index_film_people_on_person_id"
  end

  create_table "film_planets", force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "planet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_film_planets_on_film_id"
    t.index ["planet_id"], name: "index_film_planets_on_planet_id"
  end

  create_table "film_starships", force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "starship_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["film_id"], name: "index_film_starships_on_film_id"
    t.index ["starship_id"], name: "index_film_starships_on_starship_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.integer "planet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["planet_id"], name: "index_people_on_planet_id"
  end

  create_table "person_starships", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "starship_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_person_starships_on_person_id"
    t.index ["starship_id"], name: "index_person_starships_on_starship_id"
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.string "population"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "starships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "film_people", "films"
  add_foreign_key "film_people", "people"
  add_foreign_key "film_planets", "films"
  add_foreign_key "film_planets", "planets"
  add_foreign_key "film_starships", "films"
  add_foreign_key "film_starships", "starships"
  add_foreign_key "people", "planets"
  add_foreign_key "person_starships", "people"
  add_foreign_key "person_starships", "starships"
end
