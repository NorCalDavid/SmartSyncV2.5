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

ActiveRecord::Schema.define(version: 20151014172454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "comamnds", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.string   "resource"
    t.string   "type",        null: false
    t.string   "endpoint",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",    default: 0, null: false
    t.integer  "attempts",    default: 0, null: false
    t.text     "handler",                 null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.integer  "reminder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "device_commands", force: :cascade do |t|
    t.integer  "device_id"
    t.string   "comamnd_id"
    t.boolean  "published"
    t.integer  "executed_count"
    t.datetime "executed_last"
    t.integer  "event_condition_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "name",                                 null: false
    t.text     "description"
    t.boolean  "favorite"
    t.integer  "status_code",          default: 999
    t.string   "status"
    t.string   "status_icon"
    t.integer  "status_level"
    t.string   "brand"
    t.string   "type"
    t.string   "location"
    t.string   "EDID"
    t.string   "version"
    t.string   "image"
    t.integer  "property_id",                          null: false
    t.integer  "room_id",                              null: false
    t.boolean  "controllable",         default: false
    t.string   "api_id"
    t.string   "api_house_id"
    t.integer  "api_firmware_version"
    t.boolean  "dimmable",             default: false
    t.integer  "dim_level",            default: 100
    t.integer  "ramp_rate",            default: 1
    t.integer  "led_level",            default: 5
    t.time     "on_time"
    t.time     "off_time"
    t.boolean  "timer_enabled",        default: false
    t.integer  "group"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "event_actions", force: :cascade do |t|
    t.string   "name",                               null: false
    t.text     "description"
    t.string   "type",                               null: false
    t.boolean  "published",          default: false, null: false
    t.datetime "published_on"
    t.string   "action"
    t.integer  "target_id"
    t.integer  "command_id"
    t.integer  "test_option_id"
    t.integer  "execution_order"
    t.integer  "executed_count",     default: 0,     null: false
    t.datetime "executed_last"
    t.integer  "event_condition_id",                 null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "event_conditions", force: :cascade do |t|
    t.string   "name",                            null: false
    t.text     "description"
    t.string   "type",                            null: false
    t.boolean  "published",       default: false, null: false
    t.datetime "published_on"
    t.string   "condition"
    t.integer  "trigger_id"
    t.integer  "test_option_id"
    t.string   "test_one"
    t.string   "test_two"
    t.integer  "event_id",                        null: false
    t.integer  "execution_order"
    t.integer  "executed_count",  default: 0,     null: false
    t.datetime "executed_last"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "event_groups", force: :cascade do |t|
    t.string   "name",                           null: false
    t.text     "description"
    t.boolean  "favorite",       default: false, null: false
    t.integer  "executed_count", default: 0,     null: false
    t.datetime "executed_last"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "event_logs", force: :cascade do |t|
    t.integer  "event_id",       null: false
    t.string   "entry_type"
    t.string   "reference_type"
    t.integer  "status_code"
    t.text     "event_status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",                           null: false
    t.text     "description"
    t.string   "type",                           null: false
    t.boolean  "published",      default: false, null: false
    t.datetime "published_on"
    t.string   "status"
    t.boolean  "favorite",       default: false, null: false
    t.integer  "executed_count", default: 0,     null: false
    t.datetime "executed_last"
    t.integer  "event_group_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "location_options", force: :cascade do |t|
    t.string   "name",              null: false
    t.text     "description"
    t.string   "location_type",     null: false
    t.boolean  "dashboard_display"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name",                                                                                                     null: false
    t.text     "description"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "image",       default: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444201245/DefaultProperty.png"
    t.integer  "user_id",                                                                                                  null: false
    t.datetime "created_at",                                                                                               null: false
    t.datetime "updated_at",                                                                                               null: false
  end

  create_table "reminders", force: :cascade do |t|
    t.string   "name",                    null: false
    t.text     "description"
    t.integer  "recipient_id"
    t.string   "receipient_phone_number"
    t.datetime "notification_time"
    t.string   "time_zone"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.string   "location"
    t.integer  "property_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "status_options", force: :cascade do |t|
    t.integer  "status_id"
    t.integer  "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "status_options", ["device_id"], name: "index_status_options_on_device_id", using: :btree
  add_index "status_options", ["status_id", "device_id"], name: "index_status_options_on_status_id_and_device_id", unique: true, using: :btree
  add_index "status_options", ["status_id"], name: "index_status_options_on_status_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.integer  "code",       null: false
    t.string   "name",       null: false
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "image"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "identities", "users"
end
