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

ActiveRecord::Schema.define(version: 20141023232003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", force: true do |t|
    t.integer  "year"
    t.integer  "professional_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.text     "comments"
    t.integer  "institution_id"
    t.integer  "qualification_id"
  end

  add_index "experiences", ["institution_id"], name: "index_experiences_on_institution_id", using: :btree
  add_index "experiences", ["qualification_id"], name: "index_experiences_on_qualification_id", using: :btree

  create_table "institutions", force: true do |t|
    t.string   "name"
    t.boolean  "active",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans_professionals", force: true do |t|
    t.integer "plan_id"
    t.integer "professional_id"
  end

  create_table "professionals", force: true do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "phone"
    t.string   "email"
    t.string   "crfa"
    t.string   "cep"
    t.string   "state"
    t.string   "city"
    t.string   "address"
    t.string   "complement"
    t.string   "neighborhood"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                    default: false
    t.integer  "graduation_institution_id"
    t.integer  "graduation_course_id"
    t.integer  "graduation_year"
  end

  add_index "professionals", ["graduation_course_id"], name: "index_professionals_on_graduation_course_id", using: :btree
  add_index "professionals", ["graduation_institution_id"], name: "index_professionals_on_graduation_institution_id", using: :btree

  create_table "professionals_specialties", force: true do |t|
    t.integer "specialty_id"
    t.integer "professional_id"
  end

  create_table "qualifications", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialties", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
