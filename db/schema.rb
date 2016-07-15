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

ActiveRecord::Schema.define(version: 20160711164910) do

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "courses_projects", id: false, force: :cascade do |t|
    t.integer "project_id"
    t.integer "course_id"
  end

  add_index "courses_projects", ["project_id", "course_id"], name: "index_courses_projects_on_project_id_and_course_id"

  create_table "interests", force: :cascade do |t|
    t.string   "interest_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "project_categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "tags"
    t.string   "url"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "product_category_id"
    t.integer  "staff_id"
    t.integer  "category_id"
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id"
  add_index "projects", ["product_category_id"], name: "index_projects_on_product_category_id"
  add_index "projects", ["staff_id"], name: "index_projects_on_staff_id"

  create_table "staffs", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "office_tel"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
