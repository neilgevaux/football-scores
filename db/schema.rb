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

ActiveRecord::Schema[7.0].define(version: 2023_08_28_113242) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fixtures", force: :cascade do |t|
    t.integer "fixture_id"
    t.string "referee"
    t.string "timezone"
    t.datetime "date"
    t.integer "timestamp"
    t.integer "first_period_start"
    t.integer "second_period_start"
    t.integer "venue_id"
    t.string "status_long"
    t.string "status_short"
    t.integer "status_elapsed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.integer "goal_id"
    t.integer "fixture_id"
    t.integer "home"
    t.integer "away"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.integer "league_id"
    t.string "name"
    t.string "country"
    t.string "logo"
    t.string "flag"
    t.integer "season"
    t.string "round"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer "score_id"
    t.integer "fixture_id"
    t.integer "halftime_home"
    t.integer "halftime_away"
    t.integer "fulltime_home"
    t.integer "fulltime_away"
    t.integer "extratime_home"
    t.integer "extratime_away"
    t.integer "penalty_home"
    t.integer "penalty_away"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "country"
    t.integer "founded"
    t.boolean "national"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
  end

  create_table "venues", force: :cascade do |t|
    t.integer "venue_id"
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.integer "capacity"
    t.string "surface"
    t.string "image"
  end

end
