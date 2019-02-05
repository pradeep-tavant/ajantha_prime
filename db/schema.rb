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

ActiveRecord::Schema.define(version: 2019_02_05_081128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "member_id"
    t.string "reason"
    t.date "on_date"
    t.time "start_time"
    t.time "end_time"
    t.text "notes"
    t.boolean "approved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "guest_count"
    t.text "response"
    t.index ["member_id"], name: "index_bookings_on_member_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.string "title"
    t.text "body"
    t.string "subject"
    t.bigint "member_id"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["member_id"], name: "index_comments_on_member_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.string "designation"
    t.string "phone"
    t.string "email"
    t.text "address"
    t.boolean "shift", default: true
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "member_id"
    t.string "subject"
    t.text "content"
    t.integer "status", default: 0
    t.integer "priority", default: 0
    t.text "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "assignee_id"
    t.index ["member_id"], name: "index_feedbacks_on_member_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "block", limit: 1
    t.integer "floor", limit: 2
    t.integer "flat", limit: 2
    t.boolean "owner", default: true
    t.boolean "active", default: true
    t.string "email"
    t.string "sec_email"
    t.string "phone"
    t.string "sec_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "admin", default: false
    t.string "login"
    t.string "slug", null: false
    t.boolean "rented", default: false
    t.boolean "admin_toggle", default: false
    t.boolean "available_for_rent", default: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.integer "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "polls", force: :cascade do |t|
    t.text "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.date "start_date"
    t.date "end_date"
    t.string "slug", null: false
    t.index ["slug"], name: "index_polls_on_slug", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "private", default: true
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.boolean "visible", default: false
    t.string "slug", null: false
    t.date "on_date", default: "2019-01-03"
    t.index ["member_id"], name: "index_posts_on_member_id"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.bigint "member_id"
    t.string "email"
    t.string "phone"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_tenants_on_member_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "transaction_id"
    t.float "amount_paid"
    t.bigint "member_id"
    t.date "on_date"
    t.integer "category"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.integer "payment_mode", default: 0
    t.index ["member_id"], name: "index_transactions_on_member_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.integer "category"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_vehicles_on_member_id"
  end

  create_table "vote_options", force: :cascade do |t|
    t.string "title"
    t.bigint "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "index_vote_options_on_poll_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "vote_option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_votes_on_member_id"
    t.index ["vote_option_id", "member_id"], name: "index_votes_on_vote_option_id_and_member_id", unique: true
    t.index ["vote_option_id"], name: "index_votes_on_vote_option_id"
  end

  add_foreign_key "vote_options", "polls"
  add_foreign_key "votes", "members"
  add_foreign_key "votes", "vote_options"
end
