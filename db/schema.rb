# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_14_175142) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competencies", force: :cascade do |t|
    t.string "competency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "option"
    t.boolean "is_correct"
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "question_competencies", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "competency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competency_id"], name: "index_question_competencies_on_competency_id"
    t.index ["question_id"], name: "index_question_competencies_on_question_id"
  end

  create_table "question_subjects", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_subjects_on_question_id"
    t.index ["subject_id"], name: "index_question_subjects_on_subject_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "author"
    t.string "topic"
    t.string "grade"
    t.text "statement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "options", "questions"
  add_foreign_key "question_competencies", "competencies"
  add_foreign_key "question_competencies", "questions"
  add_foreign_key "question_subjects", "questions"
  add_foreign_key "question_subjects", "subjects"
end
