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

ActiveRecord::Schema.define(version: 20180510112931) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "email_service_id"
    t.integer  "shop_id"
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["email_service_id"], name: "index_accounts_on_email_service_id"
    t.index ["shop_id"], name: "index_accounts_on_shop_id"
  end

  create_table "email_services", force: :cascade do |t|
    t.string   "login"
    t.string   "password"
    t.string   "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keys", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "access_key_id"
    t.string   "secret_access_key"
    t.datetime "expired_at"
    t.datetime "last_check_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["account_id"], name: "index_keys_on_account_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer  "shop_id"
    t.string   "name"
    t.string   "asin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.string   "domain"
    t.string   "api_domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end