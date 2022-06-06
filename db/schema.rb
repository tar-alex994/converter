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

ActiveRecord::Schema[7.0].define(version: 2022_06_06_153426) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "logs", force: :cascade do |t|
    t.string "remote_ip"
    t.string "request_id"
    t.string "method"
    t.string "query_string"
    t.string "path"
    t.string "request_parameters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["method"], name: "index_logs_on_method"
    t.index ["query_string"], name: "index_logs_on_query_string"
    t.index ["remote_ip"], name: "index_logs_on_remote_ip"
  end

  create_table "products", force: :cascade do |t|
    t.string "date_of_rejection"
    t.string "plu"
    t.string "quantity"
    t.string "type_of_quantity"
  end

end
