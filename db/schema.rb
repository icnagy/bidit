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

ActiveRecord::Schema.define(:version => 20130718140818) do

  create_table "bids", :force => true do |t|
    t.integer "item_auction_id"
    t.integer "user_id"
    t.decimal "bid"
    t.datetime "bidtime"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "item_auctions", :force => true do |t|
    t.integer "item_id"
    t.string "status"
    t.datetime "starttime"
    t.datetime "endtime"
    t.decimal "starting_bid"
    t.decimal "bid_step"
    t.integer "lastbid_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "item_categories", :force => true do |t|
    t.string "name"
    t.string "picture"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.integer "item_category_id"
    t.integer "item_auction_id"
    t.string "name", :null => false
    t.date "manufactured"
    t.string "state"
    t.string "picture"
    t.text "description"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.boolean "is_admin"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
