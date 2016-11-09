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

ActiveRecord::Schema.define(version: 20161031102101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string   "foto"
    t.string   "sku"
    t.string   "collection"
    t.string   "complect"
    t.string   "proba"
    t.string   "title"
    t.string   "category"
    t.string   "shortdesc"
    t.string   "gruppa"
    t.string   "vstavka"
    t.string   "metalcolor"
    t.string   "size"
    t.decimal  "price"
    t.integer  "quantity"
    t.string   "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
