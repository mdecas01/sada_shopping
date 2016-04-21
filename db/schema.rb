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

ActiveRecord::Schema.define(version: 20160421150913) do

# Could not dump table "carts" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent"
  end

  create_table "categorizations", force: true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id"
  add_index "categorizations", ["product_id"], name: "index_categorizations_on_product_id"

  create_table "coupons", force: true do |t|
    t.string   "token"
    t.integer  "discount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.date     "expire"
    t.boolean  "redeemed"
  end

  create_table "orders", force: true do |t|
    t.text     "address"
    t.string   "payment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "dispatched"
    t.integer  "user_id"
    t.string   "coupon"
    t.decimal  "total"
  end

  create_table "product_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   default: 1
    t.integer  "order_id"
  end

  add_index "product_items", ["cart_id"], name: "index_product_items_on_cart_id"
  add_index "product_items", ["order_id"], name: "index_product_items_on_order_id"
  add_index "product_items", ["product_id"], name: "index_product_items_on_product_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  create_table "reviews", force: true do |t|
    t.integer  "stars"
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["product_id"], name: "index_reviews_on_product_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
  end

  create_table "wishlists", force: true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wishlists", ["product_id"], name: "index_wishlists_on_product_id"
  add_index "wishlists", ["user_id"], name: "index_wishlists_on_user_id"

end
