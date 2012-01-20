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

ActiveRecord::Schema.define(:version => 20120119232332) do

  create_table "feedbacks", :force => true do |t|
    t.text     "comment"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "specialty_id"
    t.string   "username"
  end

  create_table "moonlyters", :force => true do |t|
    t.text     "description"
    t.float    "rating"
    t.text     "education"
    t.text     "experience"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "requests", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "title"
    t.integer  "user_id"
  end

  create_table "specialties", :force => true do |t|
    t.text     "description"
    t.float    "rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "moonlyter_id"
    t.integer  "total_rating"
    t.float    "average_rating"
    t.integer  "num_ratings"
  end

  create_table "tags", :force => true do |t|
    t.integer  "specialty_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.string   "password_digest"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
