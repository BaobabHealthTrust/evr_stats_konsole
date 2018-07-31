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

ActiveRecord::Schema.define(version: 20180731130410) do

  create_table "ahoy_events", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "visit_id"
    t.integer "user_id"
    t.string "name"
    t.string "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
  end

  create_table "ahoy_visits", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.integer "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.datetime "started_at"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "category", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 100, null: false
    t.string "description", null: false
    t.date "date", null: false
  end

  create_table "media", primary_key: "media_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "news_id", null: false
    t.string "filename", limit: 100
    t.string "content_type", limit: 100
    t.binary "data", limit: 4294967295
  end

  create_table "news", primary_key: "news_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "title", null: false
    t.text "body", limit: 4294967295, null: false
    t.string "category", limit: 60, null: false
    t.date "date", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "site_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "site_name"
    t.string "site_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracker", primary_key: "tracker_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "news_id", null: false
    t.string "ip_address", limit: 20, null: false
    t.string "category", limit: 100, null: false
    t.date "date", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "user", primary_key: "user_id", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "fname", limit: 100, null: false
    t.string "lname", limit: 100, null: false
    t.string "username", limit: 100, null: false
    t.string "password", limit: 100, null: false
    t.date "date", null: false
  end

end
