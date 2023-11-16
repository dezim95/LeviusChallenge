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

ActiveRecord::Schema[7.0].define(version: 2023_11_16_000032) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "competencies", force: :cascade do |t|
    t.string "competency_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "option"
    t.boolean "is_correct"
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "files_type"
    t.bigint "files_id"
    t.index ["files_type", "files_id"], name: "index_options_on_files"
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
    t.string "files_type"
    t.bigint "files_id"
    t.index ["files_type", "files_id"], name: "index_questions_on_files"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "options", "questions"
  add_foreign_key "question_competencies", "competencies"
  add_foreign_key "question_competencies", "questions"
  add_foreign_key "question_subjects", "questions"
  add_foreign_key "question_subjects", "subjects"
end
