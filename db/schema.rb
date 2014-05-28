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

ActiveRecord::Schema.define(version: 20140521004633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campsites", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sitename"
    t.string   "nearesttown"
    t.string   "state"
    t.string   "country"
    t.string   "website"
    t.string   "region"
    t.decimal  "longitude",               precision: 10, scale: 6
    t.decimal  "latitude",                precision: 10, scale: 6
    t.string   "phone"
    t.integer  "numberofsites"
    t.decimal  "distancefromnearesttown", precision: 7,  scale: 3
  end

end
