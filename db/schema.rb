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

ActiveRecord::Schema.define(version: 20160905123827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "admin_id"
  end

  add_index "abouts", ["admin_id"], name: "index_abouts_on_admin_id", using: :btree

  create_table "admins", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "tel"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "pnumber"
    t.string   "remember_digest"
  end

  create_table "allocations", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "staff_id"
    t.integer  "supervision_type_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "allocations", ["staff_id"], name: "index_allocations_on_staff_id", using: :btree
  add_index "allocations", ["student_id"], name: "index_allocations_on_student_id", using: :btree
  add_index "allocations", ["supervision_type_id"], name: "index_allocations_on_supervision_type_id", using: :btree

  create_table "applicationreplies", force: :cascade do |t|
    t.integer  "project_application_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "commenter"
    t.string   "note"
  end

  add_index "applicationreplies", ["project_application_id"], name: "index_applicationreplies_on_project_application_id", using: :btree

  create_table "archives", force: :cascade do |t|
    t.integer  "staff_id"
    t.integer  "project_application_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "archives", ["project_application_id"], name: "index_archives_on_project_application_id", using: :btree
  add_index "archives", ["staff_id"], name: "index_archives_on_staff_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "department_id"
  end

  add_index "courses", ["department_id"], name: "index_courses_on_department_id", using: :btree

  create_table "courses_projects", id: false, force: :cascade do |t|
    t.integer "project_id"
    t.integer "course_id"
  end

  add_index "courses_projects", ["project_id", "course_id"], name: "index_courses_projects_on_project_id_and_course_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "department_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "faculty_id"
  end

  add_index "departments", ["faculty_id"], name: "index_departments_on_faculty_id", using: :btree

  create_table "faculties", force: :cascade do |t|
    t.string   "faculty_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
  end

  add_index "feedbacks", ["student_id"], name: "index_feedbacks_on_student_id", using: :btree

  create_table "helps", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "admin_id"
  end

  add_index "helps", ["admin_id"], name: "index_helps_on_admin_id", using: :btree

  create_table "interests", force: :cascade do |t|
    t.string   "interest_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string   "level_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_applications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
    t.integer  "project_id"
    t.integer  "staff_id"
  end

  add_index "project_applications", ["project_id"], name: "index_project_applications_on_project_id", using: :btree
  add_index "project_applications", ["staff_id"], name: "index_project_applications_on_staff_id", using: :btree
  add_index "project_applications", ["student_id"], name: "index_project_applications_on_student_id", using: :btree

  create_table "project_categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_suggestions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "student_id"
    t.integer  "staff_id"
    t.text     "note"
  end

  add_index "project_suggestions", ["staff_id"], name: "index_project_suggestions_on_staff_id", using: :btree
  add_index "project_suggestions", ["student_id"], name: "index_project_suggestions_on_student_id", using: :btree

  create_table "project_tags", force: :cascade do |t|
    t.string   "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_tags_projects", id: false, force: :cascade do |t|
    t.integer "project_id",     null: false
    t.integer "project_tag_id", null: false
  end

  create_table "project_tags_students", id: false, force: :cascade do |t|
    t.integer "student_id",     null: false
    t.integer "project_tag_id", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "tags"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "staff_id"
    t.integer  "category_id"
    t.integer  "level_id"
    t.boolean  "visible"
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id", using: :btree
  add_index "projects", ["level_id"], name: "index_projects_on_level_id", using: :btree
  add_index "projects", ["staff_id"], name: "index_projects_on_staff_id", using: :btree

  create_table "shortlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
    t.integer  "project_id"
  end

  add_index "shortlists", ["project_id"], name: "index_shortlists_on_project_id", using: :btree
  add_index "shortlists", ["student_id"], name: "index_shortlists_on_student_id", using: :btree

  create_table "staffs", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "office_tel"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "profile"
    t.integer  "department_id"
    t.string   "pnumber"
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "staffs", ["department_id"], name: "index_staffs_on_department_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "course_id"
    t.string   "additional_interest"
    t.integer  "level_id"
    t.string   "pnumber"
    t.string   "remember_digest"
  end

  add_index "students", ["course_id"], name: "index_students_on_course_id", using: :btree
  add_index "students", ["level_id"], name: "index_students_on_level_id", using: :btree

  create_table "suggestionreplies", force: :cascade do |t|
    t.string   "note"
    t.integer  "project_suggestion_id"
    t.string   "commenter"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "suggestionreplies", ["project_suggestion_id"], name: "index_suggestionreplies_on_project_suggestion_id", using: :btree

  create_table "supervision_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "archives", "project_applications"
  add_foreign_key "archives", "staffs"
end
