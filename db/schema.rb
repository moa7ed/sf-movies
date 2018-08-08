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

ActiveRecord::Schema.define(version: 20180804235204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_actors_on_name", unique: true, using: :btree
  end

  create_table "actors_movies", id: false, force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "actor_id", null: false
    t.index ["movie_id", "actor_id"], name: "index_actors_movies_on_movie_id_and_actor_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address",    null: false
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_locations_on_address", unique: true, using: :btree
  end

  create_table "locations_movies", id: false, force: :cascade do |t|
    t.integer "movie_id",    null: false
    t.integer "location_id", null: false
    t.index ["movie_id", "location_id"], name: "index_locations_movies_on_movie_id_and_location_id", using: :btree
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title",        null: false
    t.integer  "release_year"
    t.string   "director"
    t.string   "writer"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["title"], name: "index_movies_on_title", unique: true, using: :btree
  end

  create_table "movies_production_companies", id: false, force: :cascade do |t|
    t.integer "movie_id",              null: false
    t.integer "production_company_id", null: false
    t.index ["movie_id", "production_company_id"], name: "short_name_for_movie_production_company_index", using: :btree
  end

  create_table "production_companies", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_production_companies_on_name", unique: true, using: :btree
  end

end
