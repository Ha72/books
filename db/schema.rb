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

ActiveRecord::Schema.define(version: 2020_11_10_004623) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.text "description"
    t.decimal "price"
    t.integer "stock_quantity"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "genre_id", null: false
    t.index ["genre_id"], name: "index_books_on_genre_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "username"
    t.text "password"
    t.string "name"
    t.string "phone"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "province_id", null: false
    t.index ["province_id"], name: "index_customers_on_province_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_books", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "book_id", null: false
    t.integer "order_id", null: false
    t.index ["book_id"], name: "index_order_books_on_book_id"
    t.index ["order_id"], name: "index_order_books_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "order_date"
    t.decimal "subtotal"
    t.decimal "gst"
    t.decimal "pst"
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "customer_id", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.decimal "gst"
    t.decimal "pst"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "books", "genres"
  add_foreign_key "customers", "provinces"
  add_foreign_key "order_books", "books"
  add_foreign_key "order_books", "orders"
  add_foreign_key "orders", "customers"
end
