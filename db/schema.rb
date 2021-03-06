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

ActiveRecord::Schema.define(:version => 20130408143416) do

  create_table "areas", :force => true do |t|
    t.integer  "zone"
    t.integer  "map_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "combos", :force => true do |t|
    t.integer  "item_id"
    t.integer  "part_1_id"
    t.integer  "part_2_id"
    t.integer  "success_rate"
    t.integer  "min"
    t.integer  "max"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "img"
    t.integer  "rarity"
    t.integer  "buy"
    t.integer  "sell"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "maps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "monster_rewards", :force => true do |t|
    t.integer  "monster_id"
    t.integer  "item_id"
    t.string   "rank"
    t.string   "action"
    t.integer  "drop_rate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "monsters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "resources", :force => true do |t|
    t.integer  "area_id"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "skill_effects", :force => true do |t|
    t.integer  "skill_id"
    t.string   "name"
    t.integer  "points"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "skill_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
