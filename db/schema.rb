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

ActiveRecord::Schema[7.0].define(version: 2022_05_14_200239) do
  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.boolean "dead", default: false
    t.boolean "unlocked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.string "color", null: false
    t.string "city_connections"
    t.integer "panic_level", default: 0
    t.boolean "starts_with_research_station", default: false
    t.boolean "research_station", default: false
    t.integer "red_cubes", default: 0
    t.integer "blue_cubes", default: 0
    t.integer "black_cubes", default: 0
    t.integer "yellow_cubes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diseases", force: :cascade do |t|
    t.string "color"
    t.string "name"
    t.integer "cubes_left", default: 24
    t.boolean "cured", default: false
    t.boolean "eradicated", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "month", null: false
    t.boolean "win"
    t.integer "outbreak_counter", default: 0
    t.integer "infection_rate", default: 2
    t.integer "funding_level", default: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infection_cards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_cards", force: :cascade do |t|
    t.boolean "dealt", default: false
    t.boolean "discarded", default: false
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_player_cards_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "city_id"
    t.integer "actions", default: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_players_on_city_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
