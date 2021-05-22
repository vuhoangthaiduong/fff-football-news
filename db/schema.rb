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

ActiveRecord::Schema.define(version: 2021_05_22_060246) do

  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "description"
    t.integer "view_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["title"], name: "index_articles_on_title"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "clubs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "history"
    t.string "stadium"
    t.string "manager"
    t.date "founded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manager"], name: "index_clubs_on_manager"
    t.index ["name"], name: "index_clubs_on_name"
    t.index ["stadium"], name: "index_clubs_on_stadium"
  end

  create_table "comments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "content"
    t.string "description"
    t.integer "thumbs_up"
    t.integer "thumbs_down"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "article_id"
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["content"], name: "index_comments_on_content"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "leagues", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "website_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "founded_at"
    t.text "region"
  end

  create_table "match_events", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "match_id"
    t.bigint "subject_team_id"
    t.bigint "object_team_id"
    t.bigint "subject_player_id"
    t.bigint "object_player_id"
    t.datetime "happened_at"
    t.integer "event_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_match_events_on_match_id"
    t.index ["object_player_id"], name: "index_match_events_on_object_player_id"
    t.index ["object_team_id"], name: "index_match_events_on_object_team_id"
    t.index ["subject_player_id"], name: "index_match_events_on_subject_player_id"
    t.index ["subject_team_id"], name: "index_match_events_on_subject_team_id"
  end

  create_table "matches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "duration"
    t.string "stage_in_league"
    t.string "judge_name"
    t.integer "first_team_goal_count"
    t.integer "second_team_goal_count"
    t.bigint "first_team_id"
    t.bigint "second_team_id"
    t.bigint "season_id"
    t.index ["first_team_id"], name: "index_matches_on_first_team_id"
    t.index ["season_id"], name: "index_matches_on_season_id"
    t.index ["second_team_id"], name: "index_matches_on_second_team_id"
  end

  create_table "matches_players", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "player_id", null: false
    t.integer "enter_at"
    t.integer "exit_at"
    t.integer "goal_count"
  end

  create_table "nationalities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.date "dob"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "club_id"
    t.bigint "position_id"
    t.bigint "nationality_id"
    t.index ["club_id"], name: "index_players_on_club_id"
    t.index ["name"], name: "index_players_on_name"
    t.index ["nationality_id"], name: "index_players_on_nationality_id"
    t.index ["position_id"], name: "index_players_on_position_id"
  end

  create_table "positions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seasons", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "start_at"
    t.date "end_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "league_id"
    t.index ["league_id"], name: "index_seasons_on_league_id"
  end

  create_table "transfer_histories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "date_of_transfer"
    t.decimal "price", precision: 10, scale: 4
    t.bigint "from_club_id", null: false
    t.bigint "to_club_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "player_id"
    t.index ["from_club_id"], name: "index_transfer_histories_on_from_club_id"
    t.index ["player_id"], name: "index_transfer_histories_on_player_id"
    t.index ["to_club_id"], name: "index_transfer_histories_on_to_club_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username"
    t.date "dob"
    t.string "email"
    t.string "password_digest"
    t.string "phone_number"
    t.decimal "balance", precision: 10, scale: 4
    t.boolean "is_admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "remember_digest"
    t.string "name"
    t.index ["email"], name: "index_users_on_email"
    t.index ["name"], name: "index_users_on_name"
    t.index ["phone_number"], name: "index_users_on_phone_number"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "match_events", "clubs", column: "object_team_id"
  add_foreign_key "match_events", "clubs", column: "subject_team_id"
  add_foreign_key "match_events", "matches"
  add_foreign_key "match_events", "players", column: "object_player_id"
  add_foreign_key "match_events", "players", column: "subject_player_id"
  add_foreign_key "matches", "clubs", column: "first_team_id"
  add_foreign_key "matches", "clubs", column: "second_team_id"
  add_foreign_key "players", "clubs"
  add_foreign_key "players", "nationalities"
  add_foreign_key "players", "positions"
  add_foreign_key "seasons", "leagues"
  add_foreign_key "transfer_histories", "clubs", column: "from_club_id"
  add_foreign_key "transfer_histories", "clubs", column: "to_club_id"
  add_foreign_key "transfer_histories", "players"
end
