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

ActiveRecord::Schema.define(version: 20170204181028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.string   "friendable_type"
    t.integer  "friendable_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blocker_id"
    t.integer  "status"
  end

  create_table "hero_quests", force: :cascade do |t|
    t.integer  "hero_id"
    t.integer  "quest_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "is_in_progress",     default: false
    t.datetime "chapter_started"
    t.integer  "completed_chapters"
    t.integer  "maximum_chapters"
    t.integer  "required_strength"
    t.integer  "required_cunning"
    t.integer  "required_magic"
    t.integer  "danger"
    t.integer  "gold_reward"
    t.integer  "experience_reward"
    t.integer  "stories_reward"
    t.boolean  "is_completed",       default: false
    t.index ["hero_id"], name: "index_hero_quests_on_hero_id", using: :btree
    t.index ["quest_id"], name: "index_hero_quests_on_quest_id", using: :btree
  end

  create_table "heroes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hp"
    t.boolean  "is_fainted",  default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "is_questing", default: false
    t.integer  "strength"
    t.integer  "cunning"
    t.integer  "magic"
    t.integer  "gold",        default: 0
    t.integer  "experience",  default: 0
    t.integer  "stories",     default: 0
    t.integer  "prestige",    default: 0
    t.index ["user_id"], name: "index_heroes_on_user_id", using: :btree
  end

  create_table "quests", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "maximum_chapters"
    t.integer  "required_strength"
    t.integer  "required_cunning"
    t.integer  "required_magic"
    t.integer  "danger"
    t.integer  "gold_reward"
    t.integer  "experience_reward"
    t.integer  "stories_reward"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
  end

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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "hero_quests", "heroes"
  add_foreign_key "hero_quests", "quests"
  add_foreign_key "heroes", "users"
end
