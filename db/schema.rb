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

ActiveRecord::Schema.define(version: 20150818231510) do

  create_table "staff_members", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "initials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timesheets", force: :cascade do |t|
    t.integer  "fp_id"
    t.date     "date"
    t.string   "task_name"
    t.string   "service_group"
    t.string   "service"
    t.string   "description"
    t.decimal  "hours"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "staff_initials"
    t.string   "job_name"
    t.integer  "staff_member_id"
  end

end
