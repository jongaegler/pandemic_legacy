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

ActiveRecord::Schema[7.0].define(version: 2022_05_17_032151) do
  create_table "characters", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.boolean "dead", default: false
    t.boolean "unlocked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.string "color"
    t.string "city_connections"
    t.integer "panic_level", default: 0
    t.boolean "starts_with_research_station", default: false
    t.boolean "research_station", default: false
    t.boolean "destroyed_research_station", default: false
    t.json "cubes", default: {"red"=>0, "blue"=>0, "yellow"=>0, "black"=>0}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diseases", force: :cascade do |t|
    t.string "color"
    t.string "name"
    t.integer "cubes_left", default: 24
    t.boolean "cured", default: false
    t.boolean "eradicated", default: false
    t.boolean "mutated", default: false
    t.boolean "treatable", default: true
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
    t.boolean "current", default: true
    t.integer "outbreak_counter", default: 0
    t.integer "infection_rate", default: 2
    t.integer "funding_level", default: 4
    t.integer "legacy_deck_counter", default: 0
    t.string "mission_briefing"
    t.integer "objectives_required", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infection_cards", force: :cascade do |t|
    t.integer "city_id"
    t.integer "position"
    t.boolean "discarded", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_infection_cards_on_city_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.boolean "active", default: true
    t.boolean "complete", default: false
    t.boolean "mandatory", default: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_cards", force: :cascade do |t|
    t.string "type"
    t.integer "city_id"
    t.integer "position"
    t.boolean "discarded", default: false
    t.boolean "epidemic", default: false
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_player_cards_on_city_id"
    t.index ["player_id"], name: "index_player_cards_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "city_id"
    t.string "name"
    t.integer "actions", default: 4
    t.integer "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_players_on_character_id"
    t.index ["city_id"], name: "index_players_on_city_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.boolean "current", default: true
    t.integer "funding_level", default: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turns", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unlocks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
