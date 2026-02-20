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

ActiveRecord::Schema[8.1].define(version: 2026_02_19_194424) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "blogs", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description", limit: 120
    t.uuid "entryable_id"
    t.string "entryable_type"
    t.datetime "reviewed_at"
    t.integer "status", default: 0
    t.string "subtitle", limit: 70
    t.text "text", null: false
    t.string "title", limit: 70, null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id", null: false
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "portfolios", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "company_name"
    t.integer "contract_type"
    t.datetime "created_at", null: false
    t.datetime "designed_at"
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "uuidv7()" }, force: :cascade do |t|
    t.string "confirmation_token", limit: 128
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.string "email"
    t.string "encrypted_password", limit: 128
    t.datetime "last_sign_in_at"
    t.string "name"
    t.string "remember_token", limit: 128
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token", unique: true
  end

  add_foreign_key "entries", "users"
end
