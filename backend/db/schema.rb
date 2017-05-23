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

ActiveRecord::Schema.define(version: 20170523154846) do

  create_table "agencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.date     "entranceDate"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "deleteFlag"
  end

  create_table "customer_in_tours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "bookedDate"
    t.string   "participated"
    t.integer  "starRating"
    t.string   "feedbackTourGuid"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "Customer_id"
    t.integer  "Tour_id"
    t.boolean  "deleteFlag"
    t.index ["Customer_id"], name: "index_customer_in_tours_on_Customer_id", using: :btree
    t.index ["Tour_id"], name: "index_customer_in_tours_on_Tour_id", using: :btree
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "note"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "User_id"
    t.boolean  "deleteFlag"
    t.index ["User_id"], name: "index_customers_on_User_id", using: :btree
  end

  create_table "ressource_for_tours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "Tour_id"
    t.integer  "Ressource_Typ_id"
    t.boolean  "deleteFlag"
    t.index ["Ressource_Typ_id"], name: "index_ressource_for_tours_on_Ressource_Typ_id", using: :btree
    t.index ["Tour_id"], name: "index_ressource_for_tours_on_Tour_id", using: :btree
  end

  create_table "ressource_typs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "deleteFlag"
  end

  create_table "statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "deleteFlag"
  end

  create_table "tour_guides", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date     "tourGuideSince"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "User_id"
    t.integer  "Agency_id"
    t.boolean  "deleteFlag"
    t.index ["Agency_id"], name: "index_tour_guides_on_Agency_id", using: :btree
    t.index ["User_id"], name: "index_tour_guides_on_User_id", using: :btree
  end

  create_table "tour_positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "position"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "Tour_id"
    t.boolean  "deleteFlag"
    t.index ["Tour_id"], name: "index_tour_positions_on_Tour_id", using: :btree
  end

  create_table "tour_to_tour_positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "tourPosition_id"
    t.datetime "startDate"
    t.datetime "endDate"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "tour_position_id"
    t.boolean  "deleteFlag"
    t.index ["tour_position_id"], name: "index_tour_to_tour_positions_on_tour_position_id", using: :btree
  end

  create_table "tours", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.integer  "maxAttendees"
    t.float    "price",         limit: 24
    t.datetime "startDate"
    t.datetime "endDate"
    t.string   "createdFrom"
    t.string   "changedFrom"
    t.integer  "syncedFrom"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "tour_guide_id"
    t.integer  "Status_id"
    t.boolean  "deleteFlag"
    t.index ["Status_id"], name: "index_tours_on_Status_id", using: :btree
    t.index ["tour_guide_id"], name: "index_tours_on_tour_guide_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "deleteFlag"
  end

  add_foreign_key "customer_in_tours", "customers", column: "Customer_id"
  add_foreign_key "customer_in_tours", "tours", column: "Tour_id"
  add_foreign_key "customers", "users", column: "User_id"
  add_foreign_key "ressource_for_tours", "ressource_typs", column: "Ressource_Typ_id"
  add_foreign_key "ressource_for_tours", "tours", column: "Tour_id"
  add_foreign_key "tour_guides", "agencies", column: "Agency_id"
  add_foreign_key "tour_guides", "users", column: "User_id"
  add_foreign_key "tour_positions", "tours", column: "Tour_id"
  add_foreign_key "tour_to_tour_positions", "tour_positions"
  add_foreign_key "tours", "statuses", column: "Status_id"
  add_foreign_key "tours", "tour_guides"
end
