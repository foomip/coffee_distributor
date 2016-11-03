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

ActiveRecord::Schema.define(version: 20161031094802) do

  create_table "coffee_bean_supplier_links", force: :cascade do |t|
    t.integer  "coffee_bean_id"
    t.integer  "supplier_id"
    t.decimal  "cost"
    t.integer  "delivery_days"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["coffee_bean_id", "supplier_id"], name: "uidx_supp_bean_link", unique: true
    t.index ["coffee_bean_id"], name: "index_coffee_bean_supplier_links_on_coffee_bean_id"
    t.index ["supplier_id"], name: "index_coffee_bean_supplier_links_on_supplier_id"
  end

  create_table "coffee_beans", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.integer  "raw_cost_markup"
    t.integer  "roasted_cost_markup"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "species"
    t.index ["name"], name: "index_coffee_beans_on_name", unique: true
  end

  create_table "roastings", force: :cascade do |t|
    t.integer  "coffee_bean_id"
    t.integer  "days"
    t.decimal  "cost"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["coffee_bean_id"], name: "index_roastings_on_coffee_bean_id", unique: true
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_suppliers_on_name", unique: true
  end

end
