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

ActiveRecord::Schema.define(version: 20170815222453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "voters", id: false, force: :cascade do |t|
    t.string "state_voter_id", null: false
    t.string "county_voter_id"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "suffix"
    t.string "birthdate"
    t.string "gender"
    t.string "add_st_num"
    t.string "add_st_name"
    t.string "add_st_type"
    t.string "add_unit_type"
    t.string "add_pre_direction"
    t.string "add_post_direction"
    t.string "add_unit_num"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "county"
    t.string "precinct"
    t.string "leg_dist"
    t.string "cong_dist"
    t.string "reg_date"
    t.string "last_vote"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_voter_id"], name: "index_voters_on_state_voter_id", unique: true
  end

end
