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

ActiveRecord::Schema.define(version: 2018_10_04_152043) do
  
  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "review_id"
    t.integer "user_id"
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "equipments", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_equipments_on_name", unique: true
  end

  create_table "hotel_equips", force: :cascade do |t|
    t.integer "hotel_id"
    t.integer "equipment_id"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_hotel_equips_on_equipment_id"
    t.index ["hotel_id"], name: "index_hotel_equips_on_hotel_id"
  end

  create_table "hotel_images", force: :cascade do |t|
    t.integer "hotel_id"
    t.string "image"
    t.index ["hotel_id"], name: "index_hotel_images_on_hotel_id"
  end

  create_table "hotel_rooms", force: :cascade do |t|
    t.integer "hotel_id"
    t.integer "room_id"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_hotel_rooms_on_hotel_id"
    t.index ["room_id"], name: "index_hotel_rooms_on_room_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.integer "level", default: 0
    t.text "description"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_hotels_on_address", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.integer "review_id"
    t.integer "user_id"
    t.index ["review_id"], name: "index_likes_on_review_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "hotel_id"
    t.integer "user_id"
    t.index ["hotel_id"], name: "index_relationships_on_hotel_id"
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "content"
    t.integer "comment_id"
    t.integer "user_id"
    t.index ["comment_id"], name: "index_replies_on_comment_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "review_images", force: :cascade do |t|
    t.integer "review_id"
    t.string "image"
    t.index ["review_id"], name: "index_review_images_on_review_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "rate", default: 0
    t.integer "hotel_id"
    t.integer "user_id"
    t.index ["hotel_id"], name: "index_reviews_on_hotel_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "type"
    t.integer "bed_numbers", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "user_type", default: 0
    t.integer "blocked", default: 0
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
