# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_27_160824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blends", force: :cascade do |t|
    t.bigint "material_id", null: false
    t.bigint "garment_id", null: false
    t.integer "percentage_material"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["garment_id"], name: "index_blends_on_garment_id"
    t.index ["material_id"], name: "index_blends_on_material_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "garments", force: :cascade do |t|
    t.string "name"
    t.bigint "brand_id", null: false
    t.index ["brand_id"], name: "index_garments_on_brand_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.boolean "synthetic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "garment_id", null: false
    t.bigint "user_id", null: false
    t.index ["garment_id"], name: "index_purchases_on_garment_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "blends", "garments"
  add_foreign_key "blends", "materials"
  add_foreign_key "garments", "brands"
  add_foreign_key "purchases", "garments"
  add_foreign_key "purchases", "users"
end
