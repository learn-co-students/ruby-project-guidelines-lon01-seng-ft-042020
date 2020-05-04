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

ActiveRecord::Schema.define(version: 20200504142910) do

  create_table "case_suspects", force: :cascade do |t|
    t.integer  "case_id"
    t.integer  "suspect_id"
    t.boolean  "guilt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cases", force: :cascade do |t|
    t.string  "title"
    t.integer "detective_id"
  end

  create_table "detectives", force: :cascade do |t|
    t.string "name"
  end

  create_table "suspects", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.string   "location"
    t.string   "hair_color"
    t.string   "one_thing_about"
    t.boolean  "into_tech"
    t.boolean  "drinks_alcohol"
    t.boolean  "multilingual"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
