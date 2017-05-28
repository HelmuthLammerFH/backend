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

ActiveRecord::Schema.define(version: 20170528171521) do

  create_table "agencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.date     "entranceDate"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.boolean  "deleteFlag"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "customer_in_tours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "bookedDate"
    t.integer  "participated"
    t.integer  "starRating"
    t.string   "feedbackTourGuid"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.boolean  "deleteFlag"
    t.integer  "customer_id"
    t.integer  "tour_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["customer_id"], name: "index_customer_in_tours_on_customer_id", using: :btree
    t.index ["tour_id"], name: "index_customer_in_tours_on_tour_id", using: :btree
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "note"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.boolean  "deleteFlag"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_customers_on_user_id", using: :btree
  end

  create_table "ressource_for_tours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "createdFrom"
    t.binary   "picture",          limit: 65535
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.boolean  "deleteFlag"
    t.integer  "Ressource_Typ_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["Ressource_Typ_id"], name: "index_ressource_for_tours_on_Ressource_Typ_id", using: :btree
  end

  create_table "ressource_typs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.boolean  "deleteFlag"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.boolean  "deleteFlag"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tour_to_positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "startDate"
    t.datetime "endDate"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.boolean  "deleteFlag"
    t.integer  "tour_id"
    t.integer  "Tourposition_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["Tourposition_id"], name: "index_tour_to_positions_on_Tourposition_id", using: :btree
    t.index ["tour_id"], name: "index_tour_to_positions_on_tour_id", using: :btree
  end

  create_table "tourguides", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "tourGuideSince"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.boolean  "deleteFlag"
    t.integer  "user_id"
    t.integer  "agency_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["agency_id"], name: "index_tourguides_on_agency_id", using: :btree
    t.index ["user_id"], name: "index_tourguides_on_user_id", using: :btree
  end

  create_table "tourpositions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "position"
    t.string   "description"
    t.float    "price",       limit: 24
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.boolean  "deleteFlag"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "maxAttendees"
    t.float    "price",        limit: 24
    t.datetime "startDate"
    t.datetime "endDate"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.boolean  "deleteFlag"
    t.integer  "status_id"
    t.integer  "Tourguide_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["Tourguide_id"], name: "index_tours_on_Tourguide_id", using: :btree
    t.index ["status_id"], name: "index_tours_on_status_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birthdate"
    t.string   "address"
    t.string   "city"
    t.string   "email"
    t.string   "username"
    t.string   "passwort"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.boolean  "deleteFlag"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "customer_in_tours", "customers"
  add_foreign_key "customer_in_tours", "tours"
  add_foreign_key "customers", "users"
  add_foreign_key "ressource_for_tours", "ressource_typs", column: "Ressource_Typ_id"
  add_foreign_key "tour_to_positions", "tourpositions", column: "Tourposition_id"
  add_foreign_key "tour_to_positions", "tours"
  add_foreign_key "tourguides", "agencies"
  add_foreign_key "tourguides", "users"
  add_foreign_key "tours", "statuses"
  add_foreign_key "tours", "tourguides", column: "Tourguide_id"
end
