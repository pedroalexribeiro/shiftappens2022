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

ActiveRecord::Schema[7.0].define(version: 2022_04_10_023652) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "options", default: {}
    t.integer "category"
    t.index ["source_type", "source_id"], name: "index_activities_on_source"
  end

  create_table "donations", force: :cascade do |t|
    t.bigint "donor_id", null: false
    t.bigint "event_id", null: false
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donor_id"], name: "index_donations_on_donor_id"
    t.index ["event_id"], name: "index_donations_on_event_id"
  end

  create_table "donor_achievements", force: :cascade do |t|
    t.bigint "donor_id", null: false
    t.bigint "achievement_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["achievement_id"], name: "index_donor_achievements_on_achievement_id"
    t.index ["donor_id"], name: "index_donor_achievements_on_donor_id"
  end

  create_table "donors", force: :cascade do |t|
    t.string "name"
    t.integer "d_type"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["d_type"], name: "index_donors_on_d_type"
    t.index ["email"], name: "index_donors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_donors_on_reset_password_token", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_events_on_organization_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "donor_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donor_id"], name: "index_favourites_on_donor_id"
    t.index ["organization_id"], name: "index_favourites_on_organization_id"
  end

  create_table "followers", force: :cascade do |t|
    t.bigint "follower_id", null: false
    t.bigint "followee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followee_id"], name: "index_followers_on_followee_id"
    t.index ["follower_id"], name: "index_followers_on_follower_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "slang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "genre"
    t.string "publisher"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_organizations_on_email", unique: true
    t.index ["reset_password_token"], name: "index_organizations_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "money"
    t.string "entity_type", null: false
    t.bigint "entity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type", "entity_id"], name: "index_wallets_on_entity"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "donations", "donors"
  add_foreign_key "donations", "events"
  add_foreign_key "donor_achievements", "achievements"
  add_foreign_key "donor_achievements", "donors"
  add_foreign_key "events", "organizations"
  add_foreign_key "favourites", "donors"
  add_foreign_key "favourites", "organizations"
  add_foreign_key "followers", "donors", column: "followee_id"
  add_foreign_key "followers", "donors", column: "follower_id"
end
