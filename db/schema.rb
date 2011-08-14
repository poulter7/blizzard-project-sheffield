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

ActiveRecord::Schema.define(:version => 20110811044714) do

  create_table "answers", :force => true do |t|
    t.integer  "participant_id"
    t.integer  "section_id"
    t.integer  "listenergroup"
    t.string   "answer_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listeningtests", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", :force => true do |t|
    t.integer  "user_id"
    t.integer  "listeningtest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "answers"
  end

  create_table "questions", :force => true do |t|
    t.string   "text"
    t.boolean  "alphanumeric"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.integer  "listeningtest_id"
    t.text     "static_links"
    t.text     "pool_links"
    t.text     "subjects"
    t.string   "question_template"
    t.integer  "index"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "section_id"
    t.integer  "question_id"
    t.integer  "subject_id"
    t.text     "elements"
    t.integer  "index"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "usergroup"
    t.boolean  "blocked"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
