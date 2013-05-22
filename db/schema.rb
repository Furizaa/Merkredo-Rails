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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130522181404) do

  create_table "accounts", :force => true do |t|
    t.string   "email",         :limit => 256
    t.string   "password_hash", :limit => 64
    t.string   "salt",          :limit => 32
    t.string   "auth_token",    :limit => 32
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "attendees", :force => true do |t|
    t.integer  "event_id",                 :null => false
    t.string   "email",                    :null => false
    t.string   "token",      :limit => 64, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name",                                        :null => false
    t.text     "body"
    t.datetime "date",                                        :null => false
    t.datetime "date_orig",                                   :null => false
    t.string   "timezone",                                    :null => false
    t.integer  "account_id",                                  :null => false
    t.string   "token",      :limit => 64,                    :null => false
    t.boolean  "verified",                 :default => false, :null => false
    t.string   "uid",                                         :null => false
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "ratings", :force => true do |t|
    t.integer  "attendee_id", :null => false
    t.integer  "event_id",    :null => false
    t.integer  "roti",        :null => false
    t.text     "shout"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
