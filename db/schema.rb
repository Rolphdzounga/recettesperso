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

ActiveRecord::Schema.define(version: 20171208234739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chefs", force: :cascade do |t|
    t.string "chefnom"
    t.string "chefemail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

  create_table "commentaires", force: :cascade do |t|
    t.text "commentairetexte"
    t.integer "chef_id"
    t.integer "recette_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "ingredientnom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preparations", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.bigint "recette_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_preparations_on_ingredient_id"
    t.index ["recette_id"], name: "index_preparations_on_recette_id"
  end

  create_table "recettes", force: :cascade do |t|
    t.string "recettenom"
    t.text "recettedesc"
    t.bigint "chef_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chef_id"], name: "index_recettes_on_chef_id"
  end

  add_foreign_key "recettes", "chefs"
end
