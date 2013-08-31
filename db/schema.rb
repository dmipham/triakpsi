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

ActiveRecord::Schema.define(:version => 20130831231022) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "description"
    t.string   "link"
    t.string   "host"
  end

  create_table "jobs", :force => true do |t|
    t.string   "industry"
    t.string   "company"
    t.string   "position"
    t.string   "description"
    t.string   "website"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "location"
    t.string   "contact_name"
    t.string   "contact_position"
    t.string   "contact_company"
    t.string   "contact_email"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.string   "school"
    t.integer  "grad_year"
    t.integer  "pledge_year"
    t.string   "pledge_semester"
    t.string   "industry"
    t.string   "company"
    t.string   "phone"
    t.string   "job_title"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "website"
    t.string   "stripe"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
