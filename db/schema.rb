# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160928050642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.string   "label"
    t.integer  "artist_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "cover_art_file_name"
    t.string   "cover_art_content_type"
    t.integer  "cover_art_file_size"
    t.datetime "cover_art_updated_at"
  end

  add_index "albums", ["artist_id"], name: "index_albums_on_artist_id", using: :btree

  create_table "artists", force: :cascade do |t|
    t.text     "bio"
    t.string   "name"
    t.string   "origin"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "profile_img_file_name"
    t.string   "profile_img_content_type"
    t.integer  "profile_img_file_size"
    t.datetime "profile_img_updated_at"
  end

  create_table "dislikes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "vote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dislikes", ["user_id"], name: "index_dislikes_on_user_id", using: :btree
  add_index "dislikes", ["vote_id"], name: "index_dislikes_on_vote_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "vote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree
  add_index "likes", ["vote_id"], name: "index_likes_on_vote_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.boolean  "features",   default: false
    t.text     "writers"
    t.integer  "album_id"
    t.integer  "artist_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "songs", ["album_id"], name: "index_songs_on_album_id", using: :btree
  add_index "songs", ["artist_id"], name: "index_songs_on_artist_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role",                   default: 0,  null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "username",               default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["song_id"], name: "index_votes_on_song_id", using: :btree

  add_foreign_key "albums", "artists"
  add_foreign_key "dislikes", "users"
  add_foreign_key "dislikes", "votes"
  add_foreign_key "likes", "users"
  add_foreign_key "likes", "votes"
  add_foreign_key "songs", "albums"
  add_foreign_key "songs", "artists"
  add_foreign_key "votes", "songs"
end
