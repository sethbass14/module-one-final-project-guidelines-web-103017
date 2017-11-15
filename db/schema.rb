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

ActiveRecord::Schema.define(version: 20171115165723) do

  create_table "show_songs", force: :cascade do |t|
    t.integer "show_id"
    t.integer "song_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string  "date"
    t.integer "year_id"
    t.integer "venue_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
  end

  create_table "years", force: :cascade do |t|
    t.integer "year"
  end

end