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

  create_table "abouts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", id: :serial, force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "tel"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pnumber"
    t.string "remember_digest"
  end

  create_table "allocations", id: :serial, force: :cascade do |t|
    t.integer "student_id"
    t.integer "staff_id"
    t.integer "supervision_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_id"], name: "index_allocations_on_staff_id"
    t.index ["student_id"], name: "index_allocations_on_student_id"
    t.index ["supervision_type_id"], name: "index_allocations_on_supervision_type_id"
  end

  create_table "applicationreplies", id: :serial, force: :cascade do |t|
    t.integer "project_application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "commenter"
    t.string "note"
    t.index ["project_application_id"], name: "index_applicationreplies_on_project_application_id"
  end

  create_table "archives", id: :serial, force: :cascade do |t|
    t.integer "staff_id"
    t.integer "project_application_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_application_id"], name: "index_archives_on_project_application_id"
    t.index ["staff_id"], name: "index_archives_on_staff_id"
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", id: :serial, force: :cascade do |t|
    t.string "course_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
    t.index ["department_id"], name: "index_courses_on_department_id"
  end

  create_table "courses_projects", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "course_id", null: false
    t.index ["project_id", "course_id"], name: "index_courses_projects_on_project_id_and_course_id"
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "departments", id: :serial, force: :cascade do |t|
    t.string "department_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "faculty_id"
    t.index ["faculty_id"], name: "index_departments_on_faculty_id"
  end

  create_table "faculties", id: :serial, force: :cascade do |t|
    t.string "faculty_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", id: :serial, force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.index ["student_id"], name: "index_feedbacks_on_student_id"
  end

  create_table "helps", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "levels", id: :serial, force: :cascade do |t|
    t.string "level_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_applications", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.integer "project_id"
    t.text "note"
    t.integer "staff_id"
    t.index ["project_id"], name: "index_project_applications_on_project_id"
    t.index ["staff_id"], name: "index_project_applications_on_staff_id"
    t.index ["student_id"], name: "index_project_applications_on_student_id"
  end

  create_table "project_suggestions", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.integer "staff_id"
    t.text "note"
    t.index ["staff_id"], name: "index_project_suggestions_on_staff_id"
    t.index ["student_id"], name: "index_project_suggestions_on_student_id"
  end

  create_table "project_tags", id: :serial, force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_tags_projects", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "project_tag_id", null: false
    t.index ["project_tag_id", "project_id"], name: "index_project_tags_projects_on_project_tag_id_and_project_id"
  end

  create_table "project_tags_students", id: false, force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "project_tag_id", null: false
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "tags"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "staff_id"
    t.integer "category_id"
    t.integer "level_id"
    t.boolean "visible"
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["level_id"], name: "index_projects_on_level_id"
    t.index ["staff_id"], name: "index_projects_on_staff_id"
  end

  create_table "shortlists", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.integer "project_id"
    t.index ["project_id"], name: "index_shortlists_on_project_id"
    t.index ["student_id"], name: "index_shortlists_on_student_id"
  end

  create_table "staffs", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "office_tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile"
    t.integer "department_id"
    t.string "pnumber"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["department_id"], name: "index_staffs_on_department_id"
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["first_name", "last_name"], name: "index_staffs_on_first_name_and_last_name"
  end

  create_table "students", id: :serial, force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.string "additional_interest"
    t.integer "level_id"
    t.string "pnumber"
    t.string "remember_digest"
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["full_name"], name: "index_students_on_full_name"
    t.index ["level_id"], name: "index_students_on_level_id"
  end

  create_table "suggestionreplies", id: :serial, force: :cascade do |t|
    t.string "note"
    t.integer "project_suggestion_id"
    t.string "commenter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_suggestion_id"], name: "index_suggestionreplies_on_project_suggestion_id"
  end

  create_table "supervision_types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "allocations", "staffs"
  add_foreign_key "allocations", "students"
  add_foreign_key "allocations", "supervision_types"
  add_foreign_key "applicationreplies", "project_applications"
  add_foreign_key "archives", "project_applications"
  add_foreign_key "archives", "staffs"
  add_foreign_key "courses", "departments"
  add_foreign_key "departments", "faculties"
  add_foreign_key "feedbacks", "students"
  add_foreign_key "project_applications", "projects"
  add_foreign_key "project_applications", "staffs"
  add_foreign_key "project_applications", "students"
  add_foreign_key "project_suggestions", "staffs"
  add_foreign_key "project_suggestions", "students"
  add_foreign_key "projects", "categories"
  add_foreign_key "projects", "levels"
  add_foreign_key "projects", "staffs"
  add_foreign_key "shortlists", "projects"
  add_foreign_key "shortlists", "students"
  add_foreign_key "staffs", "departments"
  add_foreign_key "students", "courses"
  add_foreign_key "students", "levels"
  add_foreign_key "suggestionreplies", "project_suggestions"
end
