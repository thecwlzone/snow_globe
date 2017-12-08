#---
# Excerpted from "Take My Money",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/nrwebpay for more book information.
#---
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

ActiveRecord::Schema.define(version: 20160923204055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "affiliates", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "country"
    t.string   "stripe_id"
    t.string   "tag"
    t.json     "verification_needed"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "stripe_charges_enabled",   default: false
    t.boolean  "stripe_transfers_enabled", default: false
    t.string   "stripe_disabled_reason"
    t.datetime "stripe_validation_due_by"
    t.index ["user_id"], name: "index_affiliates_on_user_id", using: :btree
  end

  create_table "day_revenues", force: :cascade do |t|
    t.date     "day"
    t.integer  "ticket_count"
    t.integer  "price_cents",        default: 0,     null: false
    t.string   "price_currency",     default: "USD", null: false
    t.integer  "discounts_cents",    default: 0,     null: false
    t.string   "discounts_currency", default: "USD", null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "discount_codes", force: :cascade do |t|
    t.string   "code"
    t.integer  "percentage"
    t.text     "description"
    t.integer  "minimum_amount_cents",      default: 0,     null: false
    t.string   "minimum_amount_currency",   default: "USD", null: false
    t.integer  "maximum_discount_cents",    default: 0,     null: false
    t.string   "maximum_discount_currency", default: "USD", null: false
    t.integer  "max_uses"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payment_line_items", force: :cascade do |t|
    t.integer  "payment_id"
    t.string   "buyable_type"
    t.integer  "buyable_id"
    t.integer  "price_cents",           default: 0,     null: false
    t.string   "price_currency",        default: "USD", null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "original_line_item_id"
    t.integer  "administrator_id"
    t.integer  "refund_status",         default: 0
    t.index ["administrator_id"], name: "index_payment_line_items_on_administrator_id", using: :btree
    t.index ["buyable_type", "buyable_id"], name: "index_payment_line_items_on_buyable_type_and_buyable_id", using: :btree
    t.index ["original_line_item_id"], name: "index_payment_line_items_on_original_line_item_id", using: :btree
    t.index ["payment_id"], name: "index_payment_line_items_on_payment_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "price_cents",                default: 0,     null: false
    t.string   "price_currency",             default: "USD", null: false
    t.integer  "status"
    t.string   "reference"
    t.string   "payment_method"
    t.string   "response_id"
    t.json     "full_response"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "original_payment_id"
    t.integer  "administrator_id"
    t.integer  "discount_code_id"
    t.integer  "discount_cents",             default: 0,     null: false
    t.string   "discount_currency",          default: "USD", null: false
    t.json     "partials"
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.integer  "shipping_method",            default: 0
    t.integer  "affiliate_id"
    t.integer  "affiliate_payment_cents",    default: 0,     null: false
    t.string   "affiliate_payment_currency", default: "USD", null: false
    t.index ["administrator_id"], name: "index_payments_on_administrator_id", using: :btree
    t.index ["affiliate_id"], name: "index_payments_on_affiliate_id", using: :btree
    t.index ["discount_code_id"], name: "index_payments_on_discount_code_id", using: :btree
    t.index ["original_payment_id"], name: "index_payments_on_original_payment_id", using: :btree
    t.index ["reference"], name: "index_payments_on_reference", using: :btree
    t.index ["user_id"], name: "index_payments_on_user_id", using: :btree
  end

  create_table "performances", force: :cascade do |t|
    t.integer  "event_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_performances_on_event_id", using: :btree
  end

  create_table "plans", force: :cascade do |t|
    t.string   "remote_id"
    t.string   "name"
    t.integer  "price_cents",     default: 0,     null: false
    t.string   "price_currency",  default: "USD", null: false
    t.integer  "interval"
    t.integer  "interval_count"
    t.integer  "tickets_allowed"
    t.string   "ticket_category"
    t.integer  "status"
    t.text     "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "address_id"
    t.integer  "shipping_method",  default: 0
    t.integer  "discount_code_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "affiliate_id"
    t.index ["address_id"], name: "index_shopping_carts_on_address_id", using: :btree
    t.index ["affiliate_id"], name: "index_shopping_carts_on_affiliate_id", using: :btree
    t.index ["discount_code_id"], name: "index_shopping_carts_on_discount_code_id", using: :btree
    t.index ["user_id"], name: "index_shopping_carts_on_user_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "status"
    t.string   "payment_method"
    t.string   "remote_id"
    t.string   "string"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["plan_id"], name: "index_subscriptions_on_plan_id", using: :btree
    t.index ["user_id"], name: "index_subscriptions_on_user_id", using: :btree
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "performance_id"
    t.integer  "status"
    t.integer  "access"
    t.integer  "price_cents",       default: 0,     null: false
    t.string   "price_currency",    default: "USD", null: false
    t.string   "reference"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "payment_reference"
    t.index ["performance_id"], name: "index_tickets_on_performance_id", using: :btree
    t.index ["user_id"], name: "index_tickets_on_user_id", using: :btree
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
    t.string   "name"
    t.string   "stripe_id"
    t.integer  "role",                   default: 0
    t.string   "authy_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  add_foreign_key "affiliates", "users"
  add_foreign_key "payment_line_items", "payments"
  add_foreign_key "payments", "affiliates"
  add_foreign_key "payments", "users"
  add_foreign_key "performances", "events"
  add_foreign_key "shopping_carts", "addresses"
  add_foreign_key "shopping_carts", "discount_codes"
  add_foreign_key "shopping_carts", "users"
  add_foreign_key "subscriptions", "plans"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "tickets", "performances"
  add_foreign_key "tickets", "users"
end
