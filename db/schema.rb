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

ActiveRecord::Schema.define(:version => 20110630014700) do

  create_table "stories", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "content"
    t.string   "comment"
    t.string   "person_in_charge_id"
    t.integer  "requiring_time"
    t.integer  "spending_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["created_at"], :name => "index_stories_on_created_at"
  add_index "stories", ["person_in_charge_id"], :name => "index_stories_on_person_in_charge_id"
  add_index "stories", ["user_id"], :name => "index_stories_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "sign_in_id"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.string   "type"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["sign_in_id"], :name => "index_users_on_sign_in_id", :unique => true

end
