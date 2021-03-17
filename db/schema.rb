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

ActiveRecord::Schema.define(version: 2021_03_17_200547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "eatings", force: :cascade do |t|
    t.bigint "eatable_id"
    t.string "eatable_type"
    t.float "quantity"
    t.bigint "intake_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["intake_id"], name: "index_eatings_on_intake_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.float "calories"
    t.float "water"
    t.float "proteins"
    t.float "carbs"
    t.float "calcium"
    t.float "phosphorus"
    t.float "sodium"
    t.float "iron"
    t.float "fat"
    t.float "potassium"
    t.float "quantity"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_default"
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "intakes", force: :cascade do |t|
    t.float "calories"
    t.string "time"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_intakes_on_user_id"
  end

  create_table "meal_foods", force: :cascade do |t|
    t.bigint "food_id"
    t.bigint "meal_id"
    t.float "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_meal_foods_on_food_id"
    t.index ["meal_id"], name: "index_meal_foods_on_meal_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "calories"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time"
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
