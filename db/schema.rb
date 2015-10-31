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

ActiveRecord::Schema.define(version: 20151023215444) do

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["confirmation_token"], name: "index_admin_users_on_confirmation_token", unique: true, using: :btree
  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  add_index "admin_users", ["unlock_token"], name: "index_admin_users_on_unlock_token", unique: true, using: :btree

  create_table "commands", force: :cascade do |t|
    t.string   "name",         null: false
    t.text     "description"
    t.string   "command_type", null: false
    t.string   "action"
    t.string   "action_type"
    t.string   "values"
    t.string   "headers"
    t.string   "route"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
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
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "device_commands", force: :cascade do |t|
    t.integer  "device_id"
    t.integer  "command_id"
    t.boolean  "published",      default: false
    t.datetime "published_on"
    t.integer  "executed_count", default: 0,     null: false
    t.datetime "executed_last"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "device_commands", ["command_id"], name: "index_device_commands_on_command_id", using: :btree
  add_index "device_commands", ["device_id", "command_id"], name: "index_device_commands_on_device_id_and_command_id", unique: true, using: :btree
  add_index "device_commands", ["device_id"], name: "index_device_commands_on_device_id", using: :btree

  create_table "devices", force: :cascade do |t|
    t.string   "name",                                                                                                            null: false
    t.text     "description"
    t.boolean  "favorite"
    t.integer  "status_code",          default: 999
    t.string   "status"
    t.integer  "status_level"
    t.string   "status_icon"
    t.string   "brand"
    t.string   "device_type"
    t.string   "location",             default: "Undefined"
    t.string   "EDID"
    t.string   "version"
    t.string   "image",                default: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444201245/DefaultDevice.png"
    t.boolean  "controllable",         default: false
    t.string   "api_id"
    t.integer  "insteon_device_id"
    t.string   "api_firmware_version"
    t.boolean  "dimmable",             default: false
    t.integer  "dim_level",            default: 100
    t.integer  "ramp_rate",            default: 1
    t.integer  "led_level",            default: 5
    t.time     "on_time"
    t.time     "off_time"
    t.boolean  "timer_enabled",        default: false
    t.integer  "group"
    t.integer  "property_id"
    t.integer  "room_id"
    t.datetime "created_at",                                                                                                      null: false
    t.datetime "updated_at",                                                                                                      null: false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "devices", ["property_id"], name: "index_devices_on_property_id", using: :btree
  add_index "devices", ["room_id"], name: "index_devices_on_room_id", using: :btree

  create_table "event_actions", force: :cascade do |t|
    t.string   "name",                               null: false
    t.text     "description"
    t.string   "type",                               null: false
    t.boolean  "published",          default: false, null: false
    t.datetime "published_on"
    t.string   "action"
    t.integer  "target_id"
    t.integer  "command_id"
    t.integer  "execution_order"
    t.integer  "executed_count",     default: 0,     null: false
    t.datetime "executed_last"
    t.integer  "event_condition_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "event_actions", ["event_condition_id"], name: "index_event_actions_on_event_condition_id", using: :btree

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
    t.integer  "execution_order"
    t.integer  "executed_count",  default: 0,     null: false
    t.datetime "executed_last"
    t.integer  "event_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "event_conditions", ["event_id"], name: "index_event_conditions_on_event_id", using: :btree

  create_table "event_groups", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "event_groups", ["property_id"], name: "index_event_groups_on_property_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "name",                            null: false
    t.datetime "start"
    t.datetime "finish"
    t.text     "description",                     null: false
    t.boolean  "all_day",     default: false,     null: false
    t.integer  "frequency",   default: 1
    t.string   "period",      default: "monthly"
    t.string   "time_zone",                       null: false
  end

  add_index "events", ["name"], name: "index_events_on_name", using: :btree

  create_table "githubs", force: :cascade do |t|
    t.string   "screen_name"
    t.string   "location"
    t.string   "image_url"
    t.string   "profile_url"
    t.string   "personal_website_url"
    t.integer  "public_repos_count"
    t.string   "public_repos_url"
    t.integer  "private_repos_count"
    t.integer  "public_gists_count"
    t.string   "public_gists_url"
    t.integer  "private_gists_count"
    t.integer  "personal_private_repos_count"
    t.integer  "total_data_stored",            limit: 8
    t.integer  "followers_count"
    t.string   "followers_url"
    t.integer  "following_count"
    t.string   "following_url"
    t.string   "starred_url"
    t.string   "subscriptions_url"
    t.string   "organizations_url"
    t.string   "events_url"
    t.date     "member_since"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "githubs", ["user_id"], name: "index_githubs_on_user_id", using: :btree

  create_table "identities", force: :cascade do |t|
    t.string   "provider",   null: false
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "location_options", force: :cascade do |t|
    t.string   "name",          null: false
    t.text     "description"
    t.string   "location_type", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "name",                                                                                                          null: false
    t.text     "description"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "image",            default: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444201245/DefaultProperty.png"
    t.string   "insteon_house_id"
    t.datetime "created_at",                                                                                                    null: false
    t.datetime "updated_at",                                                                                                    null: false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree

  create_table "reminders", force: :cascade do |t|
    t.string   "name",                   null: false
    t.text     "description"
    t.integer  "recipient_id"
    t.string   "recipient_name"
    t.string   "recipient_phone_number"
    t.datetime "notification_time"
    t.string   "time_zone"
    t.integer  "property_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "reminders", ["property_id"], name: "index_reminders_on_property_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.string   "location",    null: false
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "rooms", ["property_id"], name: "index_rooms_on_property_id", using: :btree

  create_table "schedule_actions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type"
    t.string   "status"
    t.integer  "target_id"
    t.integer  "command_id"
    t.string   "action"
    t.integer  "schedule_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "schedule_actions", ["schedule_id"], name: "index_schedule_actions_on_schedule_id", using: :btree

  create_table "schedule_conditions", force: :cascade do |t|
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
    t.integer  "execution_order"
    t.integer  "executed_count",  default: 0,     null: false
    t.datetime "executed_last"
    t.integer  "schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "schedule_conditions", ["schedule_id"], name: "index_schedule_conditions_on_schedule_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "frequency",      default: 1
    t.string   "period",         default: "monthly"
    t.datetime "start_time",                         null: false
    t.datetime "end_time",                           null: false
    t.string   "time_zone",                          null: false
    t.boolean  "all_day",        default: false
    t.string   "type",                               null: false
    t.boolean  "published",      default: false
    t.datetime "published_on"
    t.boolean  "favorite",       default: false
    t.integer  "executed_count", default: 0,         null: false
    t.datetime "executed_last"
    t.integer  "property_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "schedules", ["property_id"], name: "index_schedules_on_property_id", using: :btree

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

  create_table "twitters", force: :cascade do |t|
    t.string   "screen_name"
    t.string   "description"
    t.string   "location"
    t.string   "image_url"
    t.string   "profile_url"
    t.integer  "followers_count"
    t.integer  "friends_count"
    t.integer  "favorites_count"
    t.date     "member_since"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "twitters", ["user_id"], name: "index_twitters_on_user_id", using: :btree

  create_table "user_devices", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_devices", ["device_id"], name: "index_user_devices_on_device_id", using: :btree
  add_index "user_devices", ["user_id", "device_id"], name: "index_user_devices_on_user_id_and_device_id", unique: true, using: :btree
  add_index "user_devices", ["user_id"], name: "index_user_devices_on_user_id", using: :btree

  create_table "user_properties", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.boolean  "favorite",              default: false
    t.boolean  "receive_notifications", default: false
    t.boolean  "authorized_control",    default: false
    t.boolean  "authorized_change",     default: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "user_properties", ["property_id"], name: "index_user_properties_on_property_id", using: :btree
  add_index "user_properties", ["user_id", "property_id"], name: "index_user_properties_on_user_id_and_property_id", unique: true, using: :btree
  add_index "user_properties", ["user_id"], name: "index_user_properties_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "name"
    t.string   "email",                               default: "",                                                                             null: false
    t.string   "encrypted_password",                  default: "",                                                                             null: false
    t.string   "image",                               default: "http://res.cloudinary.com/hupgpadmb/image/upload/v1444201245/DefaultUser.png"
    t.string   "phone",                    limit: 50
    t.string   "mobile",                   limit: 50
    t.boolean  "receive_sms",                         default: false,                                                                          null: false
    t.string   "insteon_token"
    t.string   "insteon_refresh_token"
    t.string   "insteon_token_type"
    t.datetime "insteon_token_expiration"
    t.boolean  "role",                                default: false,                                                                          null: false
    t.integer  "admin_user_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       default: 0,                                                                              null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                                                                                                   null: false
    t.datetime "updated_at",                                                                                                                   null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "device_commands", "commands"
  add_foreign_key "device_commands", "devices"
  add_foreign_key "devices", "properties"
  add_foreign_key "devices", "rooms"
  add_foreign_key "event_actions", "event_conditions"
  add_foreign_key "event_conditions", "events"
  add_foreign_key "event_groups", "properties"
  add_foreign_key "githubs", "users"
  add_foreign_key "identities", "users"
  add_foreign_key "reminders", "properties"
  add_foreign_key "rooms", "properties"
  add_foreign_key "schedule_actions", "schedules"
  add_foreign_key "schedule_conditions", "schedules"
  add_foreign_key "schedules", "properties"
  add_foreign_key "status_options", "devices"
  add_foreign_key "status_options", "statuses"
  add_foreign_key "twitters", "users"
  add_foreign_key "user_devices", "devices"
  add_foreign_key "user_devices", "users"
  add_foreign_key "user_properties", "properties"
  add_foreign_key "user_properties", "users"
end
