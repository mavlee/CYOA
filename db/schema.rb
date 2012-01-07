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

ActiveRecord::Schema.define(:version => 20120107224452) do

  create_table "stories", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "start_node"
  end

  create_table "story_branches", :force => true do |t|
    t.integer  "from_node"
    t.integer  "to_node"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "story_nodes", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "story_paths", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "content",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storypaths", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
