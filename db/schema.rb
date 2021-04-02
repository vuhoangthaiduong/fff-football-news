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

ActiveRecord::Schema.define(version: 2021_03_29_125908) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "description"
    t.integer "view_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["title"], name: "index_articles_on_title"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "history"
    t.string "stadium"
    t.string "founder"
    t.date "founded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["founder"], name: "index_clubs_on_founder"
    t.index ["name"], name: "index_clubs_on_name"
    t.index ["stadium"], name: "index_clubs_on_stadium"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.string "description"
    t.integer "thumbs_up"
    t.integer "thumbs_down"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "article_id"
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["content"], name: "index_comments_on_content"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "website_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matches", force: :cascade do |t|
    t.date "start_at"
    t.date "end_at"
    t.integer "duration"
    t.string "stage_in_league"
    t.string "judge_name"
    t.integer "first_team_goal_count"
    t.integer "second_team_goal_count"
    t.string "match_event"
    t.integer "first_team_id_id"
    t.integer "second_team_id_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["first_team_id_id"], name: "index_matches_on_first_team_id_id"
    t.index ["second_team_id_id"], name: "index_matches_on_second_team_id_id"
  end

  create_table "matches_players", id: false, force: :cascade do |t|
    t.integer "match_id", null: false
    t.integer "player_id", null: false
    t.integer "enter_at"
    t.integer "exit_at"
    t.integer "goal_count"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.date "dob"
    t.string "description"
    t.integer "view_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "club_id"
    t.index ["club_id"], name: "index_players_on_club_id"
    t.index ["name"], name: "index_players_on_name"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.date "start_at"
    t.date "end_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "league_id"
    t.index ["league_id"], name: "index_seasons_on_league_id"
  end

  create_table "transfer_history", force: :cascade do |t|
    t.date "date_of_transfer"
    t.string "from_club_id"
    t.string "to_club_id"
    t.decimal "price", precision: 10, scale: 4
    t.integer "from_club_id_id", null: false
    t.integer "to_club_id_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_club_id_id"], name: "index_transfer_history_on_from_club_id_id"
    t.index ["to_club_id_id"], name: "index_transfer_history_on_to_club_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.date "dob"
    t.string "email"
    t.string "password_digest"
    t.string "phone_number"
    t.decimal "balance", precision: 10, scale: 4
    t.boolean "is_admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["phone_number"], name: "index_users_on_phone_number"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "articles", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "matches", "clubs", column: "second_team_id_id"
  add_foreign_key "matches", "first_team_ids"
  add_foreign_key "players", "clubs"
  add_foreign_key "seasons", "leagues"
  add_foreign_key "transfer_history", "clubs", column: "from_club_id"
  add_foreign_key "transfer_history", "clubs", column: "to_club_id"
end
