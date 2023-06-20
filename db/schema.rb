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

ActiveRecord::Schema[7.0].define(version: 2023_06_19_124436) do
  create_table "j33_action_log_configs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "type_title", null: false
    t.string "type_alias", null: false
    t.string "id_holder"
    t.string "title_holder"
    t.string "table_name"
    t.string "text_prefix"
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_action_logs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "message_language_key", null: false
    t.text "message", null: false
    t.datetime "log_date", null: false
    t.string "extension", limit: 50, null: false
    t.bigint "user_id", default: 0, null: false
    t.integer "item_id", default: 0, null: false
    t.string "ip_address", limit: 40, default: "0.0.0.0", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["extension", "item_id"], name: "idx_extension_item_id"
    t.index ["user_id", "extension"], name: "idx_user_id_extension"
    t.index ["user_id", "log_date"], name: "idx_user_id_logdate"
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "j33_action_logs_extensions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "extension", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_action_logs_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "notify", limit: 1, null: false, unsigned: true
    t.text "extensions", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notify"], name: "idx_notify"
    t.index ["user_id"], name: "index_j33_action_logs_users_on_user_id", unique: true
  end

  create_table "j33_ak_profiles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "description", null: false
    t.text "configuration", size: :long
    t.text "filters", size: :long
    t.integer "quickicon", limit: 1, default: 1, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_ak_stats", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "description", null: false
    t.text "comment", size: :long
    t.timestamp "backupstart"
    t.timestamp "backupend"
    t.string "status", default: "run", null: false
    t.string "origin", limit: 30, default: "backend", null: false
    t.string "type", limit: 30, default: "full", null: false
    t.bigint "profile_id", default: 1, null: false
    t.text "archivename", size: :long
    t.text "absolute_path", size: :long
    t.integer "multipart", default: 0, null: false
    t.string "tag"
    t.string "backupid"
    t.boolean "filesexist", default: true, null: false
    t.string "remote_filename", limit: 1000
    t.bigint "total_size", default: 0, null: false
    t.integer "frozen", limit: 1, default: 0
    t.integer "instep", limit: 1, default: 0
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["filesexist", "status"], name: "idx_fullstatus"
    t.index ["profile_id"], name: "index_j33_ak_stats_on_profile_id"
    t.index ["status", "origin"], name: "idx_stale"
  end

  create_table "j33_ak_storages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "tag", null: false
    t.timestamp "lastupdate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text "data", size: :long
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag"], name: "idx_tag", unique: true, length: 100
  end

  create_table "j33_akeeba_commons", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", limit: 190, null: false
    t.text "value", size: :long, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "idx_key", unique: true
  end

  create_table "j33_assets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "parent_id", default: 0, null: false, comment: "Nested set parent."
    t.integer "lft", default: 0, null: false, comment: "Nested set lft."
    t.integer "rgt", default: 0, null: false, comment: "Nested set rgt."
    t.integer "level", null: false, comment: "The cached level in the nested tree.", unsigned: true
    t.string "name", limit: 50, null: false, comment: "The unique name for the asset.\\n"
    t.string "title", limit: 100, null: false, comment: "The descriptive title for the asset."
    t.string "rules", limit: 5120, null: false, comment: "JSON encoded access control."
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lft", "rgt"], name: "idx_lft_rgt"
    t.index ["name"], name: "idx_asset_name", unique: true
    t.index ["parent_id"], name: "idx_parent_id"
  end

  create_table "j33_associations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "context", limit: 50, null: false, comment: "The context of the associated item."
    t.string "key", limit: 32, null: false, comment: "The key for the association computed from an md5 on associated ids."
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["context"], name: "idx_context", unique: true
    t.index ["key"], name: "idx_key"
  end

  create_table "j33_banner_clients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "contact", null: false
    t.string "email", null: false
    t.text "extrainfo", size: :medium, null: false
    t.integer "state", limit: 1, default: 0, null: false
    t.integer "checked_out", default: 0, null: false, unsigned: true
    t.datetime "checked_out_time", null: false
    t.text "metakey", size: :medium, null: false
    t.integer "own_prefix", limit: 1, default: 0, null: false
    t.string "metakey_prefix", null: false
    t.integer "purchase_type", limit: 1, default: -1, null: false
    t.integer "track_clicks", limit: 1, default: -1, null: false
    t.integer "track_impressions", limit: 1, default: -1, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metakey_prefix"], name: "idx_metakey_prefix", length: 100
    t.index ["own_prefix"], name: "idx_own_prefix"
  end

  create_table "j33_banner_tracks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "track_date", null: false
    t.integer "track_type", null: false, unsigned: true
    t.bigint "banner_id", null: false
    t.integer "count", default: 0, null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["banner_id"], name: "idx_banner_id"
    t.index ["track_date", "track_type", "banner_id"], name: "idx_PRIMARY", unique: true
    t.index ["track_date"], name: "idx_track_date"
    t.index ["track_type"], name: "idx_track_type"
  end

  create_table "j33_banners", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "cid", default: 0, null: false
    t.integer "type", default: 0, null: false
    t.string "name", null: false
    t.string "alias", limit: 400, null: false
    t.integer "imptotal", default: 0, null: false
    t.integer "impmade", default: 0, null: false
    t.integer "clicks", default: 0, null: false
    t.string "clickurl", limit: 200, null: false
    t.integer "state", limit: 1, default: 0, null: false
    t.bigint "cat_id", default: 0, null: false
    t.text "description", size: :medium, null: false
    t.string "custombannercode", limit: 2048, null: false
    t.integer "sticky", limit: 1, default: 0, null: false, unsigned: true
    t.integer "ordering", default: 0, null: false
    t.text "metakey", size: :medium, null: false
    t.text "params", size: :medium, null: false
    t.integer "own_prefix", limit: 1, default: 0, null: false
    t.string "metakey_prefix", limit: 400, null: false
    t.integer "purchase_type", limit: 1, default: -1, null: false
    t.integer "track_clicks", limit: 1, default: -1, null: false
    t.integer "track_impressions", limit: 1, default: -1, null: false
    t.integer "checked_out", default: 0, null: false, unsigned: true
    t.datetime "checked_out_time", null: false
    t.datetime "published_up", null: false
    t.datetime "published_down", null: false
    t.datetime "reset", null: false
    t.datetime "created", null: false
    t.string "language", limit: 7, null: false
    t.integer "created_by", default: 0, null: false, unsigned: true
    t.string "created_by_alias", null: false
    t.datetime "modified", null: false
    t.integer "modified_by", default: 0, null: false, unsigned: true
    t.integer "version", default: 1, null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "idx_banner_catid"
    t.index ["language"], name: "idx_language"
    t.index ["metakey_prefix"], name: "idx_metakey_prefix", length: 100
    t.index ["own_prefix"], name: "idx_own_prefix"
    t.index ["state"], name: "idx_state"
  end

  create_table "j33_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "asset_id", default: 0, null: false, comment: "FK to the jos_assets table."
    t.integer "parent_id", default: 0, null: false, unsigned: true
    t.integer "lft", default: 0, null: false
    t.integer "rgt", default: 0, null: false
    t.integer "level", default: 0, null: false, unsigned: true
    t.string "path", limit: 400, null: false
    t.string "extension", limit: 50, null: false
    t.string "title", null: false
    t.string "alias", limit: 400, null: false
    t.string "note", null: false
    t.text "description", size: :medium
    t.boolean "published", default: false, null: false
    t.integer "checked_out", default: 0, null: false, unsigned: true
    t.datetime "checked_out_time", null: false
    t.integer "access", default: 0, null: false, unsigned: true
    t.text "params"
    t.string "metadesc", limit: 1024, null: false, comment: "The meta description for the page."
    t.string "metakey", limit: 1024, null: false, comment: "The meta keywords for the page."
    t.string "metadata", limit: 2048, null: false, comment: "JSON encoded metadata properties."
    t.integer "created_user_id", default: 0, null: false, unsigned: true
    t.datetime "created_time", null: false
    t.integer "modified_user_id", default: 0, null: false, unsigned: true
    t.datetime "modified_time", null: false
    t.integer "hits", default: 0, null: false, unsigned: true
    t.string "language", limit: 7, null: false
    t.integer "version", default: 1, null: false, unsigned: true
    t.string "token", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access"], name: "idx_access"
    t.index ["alias"], name: "idx_alias", length: 100
    t.index ["asset_id"], name: "index_j33_categories_on_asset_id"
    t.index ["checked_out"], name: "idx_checkout"
    t.index ["extension", "published", "access"], name: "cat_idx"
    t.index ["language"], name: "idx_language"
    t.index ["lft", "rgt"], name: "idx_left_right"
    t.index ["path"], name: "idx_path", length: 100
  end

  create_table "j33_cjlib_configs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "config_name", null: false
    t.text "config_value", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["config_name"], name: "index_j33_cjlib_configs_on_config_name", unique: true
  end

  create_table "j33_contact_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "alias", limit: 400, null: false
    t.string "con_position"
    t.text "address", size: :medium
    t.string "suburb", limit: 100
    t.string "state", limit: 100
    t.string "country", limit: 100
    t.string "postcode", limit: 100
    t.string "telephone"
    t.string "fax"
    t.text "misc", size: :long
    t.string "image"
    t.string "email_to"
    t.integer "default_con", limit: 1, default: 0, null: false, unsigned: true
    t.boolean "published", default: false, null: false
    t.integer "checked_out", default: 0, null: false, unsigned: true
    t.datetime "checked_out_time", null: false
    t.integer "ordering", default: 0, null: false
    t.text "params", size: :medium, null: false
    t.bigint "user_id", default: 0, null: false
    t.bigint "cat_id", default: 0, null: false
    t.integer "access", default: 0, null: false, unsigned: true
    t.string "mobile", null: false
    t.string "webpage", null: false
    t.string "sortname1", null: false
    t.string "sortname2", null: false
    t.string "sortname3", null: false
    t.string "language", limit: 7, null: false
    t.datetime "created", null: false
    t.integer "created_by", default: 0, null: false, unsigned: true
    t.string "created_by_alias", null: false
    t.datetime "modified", null: false
    t.integer "modified_by", default: 0, null: false, unsigned: true
    t.text "metakey", size: :medium, null: false
    t.text "metadesc", size: :medium, null: false
    t.text "metadata", size: :medium, null: false
    t.integer "featured", limit: 1, default: 0, null: false, comment: "Set if article is featured.", unsigned: true
    t.string "xreference", limit: 50, null: false, comment: "A reference to enable linkages to external data sets."
    t.datetime "publish_up", null: false
    t.datetime "publish_down", null: false
    t.integer "version", default: 1, null: false, unsigned: true
    t.integer "hits", default: 0, null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access"], name: "idx_access"
    t.index ["cat_id"], name: "idx_catid"
    t.index ["checked_out"], name: "idx_checkout"
    t.index ["created_by"], name: "idx_createdby"
    t.index ["featured", "cat_id"], name: "idx_featured_catid"
    t.index ["language"], name: "idx_language"
    t.index ["published"], name: "idx_state"
    t.index ["user_id"], name: "index_j33_contact_details_on_user_id"
    t.index ["xreference"], name: "idx_xreference"
  end

  create_table "j33_content_frontpages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "content_id", default: 0, null: false
    t.integer "ordering", default: 0, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_j33_content_frontpages_on_content_id", unique: true
  end

  create_table "j33_content_ratings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "content_id", default: 0, null: false
    t.integer "rating_sum", default: 0, null: false, unsigned: true
    t.integer "rating_count", default: 0, null: false, unsigned: true
    t.string "lastip", limit: 50, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "idx_PRIMARY"
  end

  create_table "j33_content_statistics", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "component", null: false
    t.integer "type", null: false
    t.integer "value", null: false
    t.timestamp "date_event", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "ip", limit: 31, null: false
    t.string "valuestring", null: false
    t.integer "reference_id", null: false
    t.bigint "user_id", null: false
    t.integer "location_id", null: false
    t.string "country", limit: 15, null: false
    t.string "state", null: false
    t.string "city", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component"], name: "component"
    t.index ["country"], name: "country"
    t.index ["location_id"], name: "location_id"
    t.index ["reference_id"], name: "reference_id"
    t.index ["type"], name: "type"
    t.index ["user_id"], name: "user_id"
  end

  create_table "j33_content_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "type_id", null: false, unsigned: true
    t.string "type_title", null: false
    t.string "type_alias", limit: 400, null: false
    t.string "table", null: false
    t.text "rules", size: :medium, null: false
    t.text "field_mappings", size: :medium, null: false
    t.string "router", null: false
    t.string "content_history_options", limit: 5120, comment: "JSON string for com_contenthistory options"
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_alias"], name: "idx_alias", length: 100
    t.index ["type_id"], name: "index_j33_content_types_on_type_id", unique: true
  end

  create_table "j33_contentitem_tag_maps", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "type_alias", null: false
    t.integer "core_content_id", null: false, comment: "PK from the core content table", unsigned: true
    t.integer "content_item_id", null: false, comment: "PK from the content type table"
    t.bigint "tag_id", null: false, comment: "PK from the tag table"
    t.timestamp "tag_date", default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Date of most recent save for this tag-item"
    t.bigint "type_id", null: false, comment: "PK from the content_type table"
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["core_content_id"], name: "idx_core_content_id"
    t.index ["tag_date", "tag_id"], name: "idx_date_id"
    t.index ["tag_id", "type_id"], name: "idx_tag_type"
    t.index ["tag_id"], name: "index_j33_contentitem_tag_maps_on_tag_id"
    t.index ["type_id", "content_item_id", "tag_id"], name: "uc_ItemnameTagid", unique: true
    t.index ["type_id"], name: "index_j33_contentitem_tag_maps_on_type_id"
  end

  create_table "j33_contents", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "asset_id", default: 0, null: false, comment: "FK to the jos_assets table."
    t.string "title", null: false
    t.string "alias", limit: 400, null: false
    t.text "introtext", size: :long, null: false
    t.text "fulltext", size: :long, null: false
    t.integer "state", limit: 1, default: 0, null: false
    t.bigint "cat_id", default: 0, null: false
    t.datetime "created", null: false
    t.integer "created_by", default: 0, null: false, unsigned: true
    t.string "created_by_alias", null: false
    t.datetime "modified", null: false
    t.integer "modified_by", default: 0, null: false, unsigned: true
    t.integer "checked_out", default: 0, null: false, unsigned: true
    t.datetime "checked_out_time", null: false
    t.datetime "publish_up", null: false
    t.datetime "publish_down", null: false
    t.text "images", size: :medium, null: false
    t.text "urls", size: :medium, null: false
    t.string "attribs", limit: 5120, null: false
    t.integer "version", default: 1, null: false, unsigned: true
    t.integer "ordering", default: 0, null: false
    t.text "metakey", size: :medium, null: false
    t.text "metadesc", size: :medium, null: false
    t.integer "access", default: 0, null: false, unsigned: true
    t.integer "hits", default: 0, null: false, unsigned: true
    t.text "metadata", size: :medium, null: false
    t.integer "featured", limit: 1, default: 0, null: false, comment: "Set if article is featured.", unsigned: true
    t.string "language", limit: 7, null: false, comment: "The language code for the article."
    t.string "xreference", limit: 50, null: false
    t.string "note", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access"], name: "idx_access"
    t.index ["alias"], name: "idx_alias", length: 191
    t.index ["asset_id"], name: "index_j33_contents_on_asset_id"
    t.index ["cat_id"], name: "idx_catid"
    t.index ["checked_out"], name: "idx_checkout"
    t.index ["created_by"], name: "idx_createdby"
    t.index ["featured", "cat_id"], name: "idx_featured_catid"
    t.index ["language"], name: "idx_language"
    t.index ["state"], name: "idx_state"
    t.index ["xreference"], name: "idx_xreference"
  end

  create_table "j33_core_log_searches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "search_term", limit: 128, null: false
    t.integer "hits", default: 0, null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_corejoomla_assets", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.string "version", limit: 32, null: false
    t.date "released", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_corejoomla_countries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "country_code", limit: 3, null: false
    t.string "country_name", limit: 64, null: false
    t.string "language", limit: 6, default: "*", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_code", "language"], name: "idx_corejoomla_countries_uniq", unique: true
  end

  create_table "j33_corejoomla_messagequeues", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "status", limit: 1, default: 0, null: false, unsigned: true
    t.string "to_addr", limit: 128, null: false
    t.string "cc_addr", limit: 128
    t.string "bcc_addr", limit: 128
    t.integer "html", limit: 1, default: 1, null: false
    t.bigint "message_id", null: false
    t.text "params", size: :medium
    t.datetime "created", null: false
    t.datetime "processed", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_j33_corejoomla_messagequeues_on_message_id"
  end

  create_table "j33_corejoomla_messages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "asset_id", null: false
    t.string "asset_name", limit: 64, null: false
    t.string "subject", null: false
    t.text "description", size: :medium, null: false
    t.string "params", limit: 999
    t.datetime "created", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_j33_corejoomla_messages_on_asset_id"
  end

  create_table "j33_corejoomla_rating_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "asset_id", null: false
    t.integer "item_id", null: false, unsigned: true
    t.integer "action_id", default: 0, null: false, unsigned: true
    t.integer "rating", null: false, unsigned: true
    t.integer "created_by", default: 0, null: false, unsigned: true
    t.datetime "created", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_j33_corejoomla_rating_details_on_asset_id"
  end

  create_table "j33_corejoomla_ratings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "item_id", null: false, unsigned: true
    t.bigint "asset_id", null: false
    t.integer "total_ratings", default: 0, null: false, unsigned: true
    t.integer "sum_rating", default: 0, null: false, unsigned: true
    t.decimal "rating", precision: 4, scale: 2, default: "0.0", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_j33_corejoomla_ratings_on_asset_id"
    t.index ["item_id", "asset_id"], name: "index_j33_corejoomla_ratings_on_item_id_and_asset_id", unique: true
  end

  create_table "j33_example_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_extensions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "extension_id", null: false
    t.integer "package_id", default: 0, null: false, comment: "Parent package ID for extensions installed as a package."
    t.string "name", limit: 100, null: false
    t.string "type", limit: 20, null: false
    t.string "element", limit: 100, null: false
    t.string "folder", limit: 100, null: false
    t.integer "client_id", limit: 1, null: false
    t.boolean "enabled", default: false, null: false
    t.integer "access", default: 1, null: false, unsigned: true
    t.boolean "protected", default: false, null: false
    t.text "manifest_cache", size: :medium, null: false
    t.text "params", size: :medium, null: false
    t.text "custom_data", size: :medium, null: false
    t.text "system_data", size: :medium, null: false
    t.integer "checked_out", default: 0, null: false, unsigned: true
    t.datetime "checked_out_time", null: false
    t.integer "ordering", default: 0
    t.integer "state", default: 0
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["element", "client_id"], name: "element_clientid"
    t.index ["element", "folder", "client_id"], name: "element_folder_clientid"
    t.index ["extension_id"], name: "index_j33_extensions_on_extension_id", unique: true
    t.index ["type", "element", "folder", "client_id"], name: "extension"
  end

  create_table "j33_fields", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "asset_id", default: 0, null: false
    t.string "context", null: false
    t.integer "group_id", default: 0, null: false, unsigned: true
    t.string "title", null: false
    t.string "name", null: false
    t.string "label", null: false
    t.text "default_value"
    t.string "type", default: "text", null: false
    t.string "note", null: false
    t.text "description", null: false
    t.integer "state", limit: 1, default: 0, null: false
    t.integer "required", limit: 1, default: 0, null: false
    t.integer "checked_out", default: 0, null: false
    t.datetime "checked_out_time", null: false
    t.integer "ordering", default: 0, null: false
    t.text "params", null: false
    t.text "fieldparams", null: false
    t.string "language", limit: 7, null: false
    t.datetime "created_time", null: false
    t.integer "created_user_id", default: 0, null: false, unsigned: true
    t.datetime "modified_time", null: false
    t.integer "modified_by", default: 0, null: false, unsigned: true
    t.integer "access", default: 1, null: false
    t.string "token", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access"], name: "idx_access"
    t.index ["asset_id"], name: "index_j33_fields_on_asset_id"
    t.index ["checked_out"], name: "idx_checkedout"
    t.index ["context"], name: "idx_context", length: 191
    t.index ["created_user_id"], name: "idx_created_user_id"
    t.index ["language"], name: "idx_language"
    t.index ["state"], name: "idx_state"
  end

  create_table "j33_fields_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "field_id", default: 0, null: false
    t.bigint "category_id", default: 0, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_j33_fields_categories_on_category_id"
    t.index ["field_id", "category_id"], name: "index_j33_fields_categories_on_field_id_and_category_id", unique: true
    t.index ["field_id"], name: "index_j33_fields_categories_on_field_id"
  end

  create_table "j33_fields_groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "asset_id", default: 0, null: false
    t.string "context", null: false
    t.string "title", null: false
    t.string "note", null: false
    t.text "description", null: false
    t.boolean "state", default: false, null: false
    t.integer "checked_out", default: 0, null: false
    t.datetime "checked_out_time", null: false
    t.integer "ordering", default: 0, null: false
    t.text "params", null: false
    t.string "language", limit: 7, null: false
    t.datetime "created", null: false
    t.integer "created_by", default: 0, null: false, unsigned: true
    t.datetime "modified", null: false
    t.integer "modified_by", default: 0, null: false, unsigned: true
    t.integer "access", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access"], name: "idx_access"
    t.index ["asset_id"], name: "index_j33_fields_groups_on_asset_id"
    t.index ["checked_out"], name: "idx_checkout"
    t.index ["context"], name: "idx_context", length: 191
    t.index ["created"], name: "idx_created_by"
    t.index ["language"], name: "idx_language"
    t.index ["state"], name: "idx_state"
  end

  create_table "j33_fields_values", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "field_id", null: false
    t.string "item_id", null: false, comment: "Allow references to items which have strings as ids, eg. none db systems."
    t.text "value"
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "idx_field_id"
    t.index ["item_id"], name: "idx_item_id", length: 191
  end

  create_table "j33_fieldsattach_categories_values", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "cat_id", null: false
    t.bigint "fields_id", null: false
    t.text "value", null: false
    t.string "token", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_j33_fieldsattach_categories_values_on_cat_id"
    t.index ["fields_id"], name: "index_j33_fieldsattach_categories_values_on_fields_id"
  end

  create_table "j33_fieldsattach_groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.string "note", limit: 150
    t.integer "access"
    t.text "description"
    t.string "position"
    t.integer "group_for"
    t.integer "showtitle", limit: 1, null: false
    t.string "catid", limit: 100, null: false
    t.string "articlesid"
    t.integer "recursive", limit: 1, null: false
    t.string "language", limit: 7, null: false
    t.integer "ordering", null: false
    t.boolean "published", null: false
    t.string "token", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_fieldsattach_images", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "articleid", null: false
    t.bigint "fieldsattach_id", null: false
    t.bigint "cat_id"
    t.string "title", null: false
    t.string "image1", null: false
    t.string "image2", null: false
    t.string "image3", null: false
    t.text "description", null: false
    t.integer "ordering", null: false
    t.boolean "published", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_j33_fieldsattach_images_on_cat_id"
    t.index ["fieldsattach_id"], name: "index_j33_fieldsattach_images_on_fieldsattach_id"
  end

  create_table "j33_fieldsattach_values", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "articleid", null: false
    t.bigint "fields_id", null: false
    t.text "value", size: :medium, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fields_id"], name: "index_j33_fieldsattach_values_on_fields_id"
  end

  create_table "j33_fieldsattaches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", limit: 200, null: false
    t.text "extras", null: false
    t.integer "showtitle", limit: 1, null: false
    t.boolean "positionarticle", default: false
    t.string "type", limit: 20, null: false
    t.integer "groupid"
    t.string "articlesid"
    t.string "language", limit: 20, null: false
    t.boolean "visible", null: false
    t.integer "ordering", null: false
    t.boolean "published", null: false
    t.boolean "required"
    t.boolean "searchable"
    t.text "params", null: false
    t.string "token", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_finder_filters", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "filter_id", null: false, unsigned: true
    t.string "title", null: false
    t.string "alias", null: false
    t.boolean "state", default: true, null: false
    t.datetime "created", null: false
    t.integer "created_by", null: false, unsigned: true
    t.string "created_by_alias", null: false
    t.datetime "modified", null: false
    t.integer "modified_by", default: 0, null: false, unsigned: true
    t.integer "checked_out", default: 0, null: false, unsigned: true
    t.datetime "checked_out_time", null: false
    t.integer "map_count", default: 0, null: false, unsigned: true
    t.text "data", size: :medium, null: false
    t.text "params", size: :long
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["filter_id"], name: "index_j33_finder_filters_on_filter_id", unique: true
  end

  create_table "j33_finder_links", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "link_id", null: false, unsigned: true
    t.string "url", null: false
    t.string "route", null: false
    t.string "title", limit: 400
    t.text "description"
    t.datetime "indexdate", null: false
    t.string "md5sum", limit: 32
    t.boolean "published", default: true, null: false
    t.integer "state", default: 1
    t.integer "access", default: 0
    t.string "language", limit: 8, null: false
    t.datetime "publish_start_date", null: false
    t.datetime "publish_end_date", null: false
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.string "list_price", default: "0", null: false
    t.string "sale_price", default: "0", null: false
    t.integer "type_id", null: false
    t.binary "object", size: :medium, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_j33_finder_links_on_link_id", unique: true
    t.index ["md5sum"], name: "idx_md5"
    t.index ["published", "state", "access", "publish_start_date", "publish_end_date", "list_price"], name: "idx_published_list"
    t.index ["published", "state", "access", "publish_start_date", "publish_end_date", "sale_price"], name: "idx_published_sale"
    t.index ["title"], name: "idx_title", length: 100
    t.index ["type_id"], name: "idx_type"
    t.index ["url"], name: "idx_url", length: 75
  end

  create_table "j33_finder_links_terms0s", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_terms0s_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_terms0s_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_terms0s_on_term_id"
  end

  create_table "j33_finder_links_terms1s", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_terms1s_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_terms1s_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_terms1s_on_term_id"
  end

  create_table "j33_finder_links_terms2s", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_terms2s_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_terms2s_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_terms2s_on_term_id"
  end

  create_table "j33_finder_links_terms3s", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_terms3s_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_terms3s_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_terms3s_on_term_id"
  end

  create_table "j33_finder_links_terms4s", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_terms4s_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_terms4s_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_terms4s_on_term_id"
  end

  create_table "j33_finder_links_terms5s", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_terms5s_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_terms5s_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_terms5s_on_term_id"
  end

  create_table "j33_finder_links_terms6s", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_terms6s_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_terms6s_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_terms6s_on_term_id"
  end

  create_table "j33_finder_links_terms7s", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_terms7s_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_terms7s_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_terms7s_on_term_id"
  end

  create_table "j33_finder_links_terms8s", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_terms8s_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_terms8s_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_terms8s_on_term_id"
  end

  create_table "j33_finder_links_terms9s", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_terms9s_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_terms9s_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_terms9s_on_term_id"
  end

  create_table "j33_finder_links_termsas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_termsas_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_termsas_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_termsas_on_term_id"
  end

  create_table "j33_finder_links_termsbs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_termsbs_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_termsbs_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_termsbs_on_term_id"
  end

  create_table "j33_finder_links_termscs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_termscs_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_termscs_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_termscs_on_term_id"
  end

  create_table "j33_finder_links_termsds", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_termsds_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_termsds_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_termsds_on_term_id"
  end

  create_table "j33_finder_links_termses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_termses_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_termses_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_termses_on_term_id"
  end

  create_table "j33_finder_links_termsfs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "term_id", null: false
    t.float "weight", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "term_id", "weight"], name: "idx_link_term_weight"
    t.index ["link_id", "term_id"], name: "index_j33_finder_links_termsfs_on_link_id_and_term_id", unique: true
    t.index ["link_id"], name: "index_j33_finder_links_termsfs_on_link_id"
    t.index ["term_id", "weight"], name: "idx_term_weight"
    t.index ["term_id"], name: "index_j33_finder_links_termsfs_on_term_id"
  end

  create_table "j33_finder_taxonomies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "parent_id", default: 0, null: false, unsigned: true
    t.string "title", null: false
    t.integer "state", limit: 1, default: 1, null: false, unsigned: true
    t.integer "access", limit: 1, default: 0, null: false, unsigned: true
    t.integer "ordering", limit: 1, default: 0, null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access"], name: "access"
    t.index ["ordering"], name: "ordering"
    t.index ["parent_id", "state", "access"], name: "idx_parent_published"
    t.index ["parent_id"], name: "parent_id"
    t.index ["state"], name: "state"
  end

  create_table "j33_finder_taxonomy_maps", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "link_id", null: false
    t.integer "node_id", null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id", "node_id"], name: "index_j33_finder_taxonomy_maps_on_link_id_and_node_id", unique: true
    t.index ["link_id"], name: "link_id"
    t.index ["node_id"], name: "node_id"
  end

  create_table "j33_finder_terms", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "term_id", null: false, unsigned: true
    t.string "term", limit: 75, null: false
    t.string "stem", limit: 75, null: false
    t.integer "common", limit: 1, default: 0, null: false, unsigned: true
    t.integer "phrase", limit: 1, default: 0, null: false, unsigned: true
    t.float "weight", default: 0.0, null: false, unsigned: true
    t.string "soundex", limit: 75, null: false
    t.integer "links", default: 0, null: false
    t.string "language", limit: 3, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["soundex", "phrase"], name: "idx_soundex_phrase"
    t.index ["stem", "phrase"], name: "idx_stem_phrase"
    t.index ["term", "phrase"], name: "idx_term_phrase"
    t.index ["term"], name: "idx_term", unique: true
    t.index ["term_id"], name: "index_j33_finder_terms_on_term_id", unique: true
  end

  create_table "j33_finder_terms_commons", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "term", limit: 75, null: false
    t.string "language", limit: 3, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language"], name: "idx_lang"
    t.index ["term", "language"], name: "idx_word_lang"
  end

  create_table "j33_finder_tokens", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "term", limit: 75, null: false
    t.string "stem", limit: 75, null: false
    t.integer "common", limit: 1, default: 0, null: false, unsigned: true
    t.integer "phrase", limit: 1, default: 0, null: false, unsigned: true
    t.float "weight", default: 1.0, null: false, unsigned: true
    t.integer "context", limit: 1, default: 2, null: false, unsigned: true
    t.string "language", limit: 3, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["context"], name: "idx_context"
    t.index ["term"], name: "idx_word"
  end

  create_table "j33_finder_tokens_aggregates", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "term_id", null: false
    t.string "map_suffix", limit: 1, null: false
    t.string "term", limit: 75, null: false
    t.string "stem", limit: 75, null: false
    t.integer "common", limit: 1, default: 0, null: false, unsigned: true
    t.integer "phrase", limit: 1, default: 0, null: false, unsigned: true
    t.float "term_weight", null: false, unsigned: true
    t.integer "context", limit: 1, default: 2, null: false, unsigned: true
    t.float "context_weight", null: false, unsigned: true
    t.float "total_weight", null: false, unsigned: true
    t.string "language", limit: 3, null: false
    t.string "token", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["term"], name: "token"
    t.index ["term_id"], name: "keyword_id"
  end

  create_table "j33_finder_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.string "mime", limit: 100, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "title", unique: true
  end

  create_table "j33_gad_dash_caches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "data", null: false
    t.integer "expire", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "j33_gad_dashes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_jbackend_keys", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.bigint "user_id", default: 0, null: false, comment: "Existing user id"
    t.integer "daily_requests", default: 0, null: false, comment: "Max number of daily requests (0=Unlimited)"
    t.datetime "expiration_date", null: false
    t.string "comment"
    t.integer "hits", default: 0, null: false, unsigned: true
    t.datetime "last_visit", null: false
    t.datetime "current_day", null: false, comment: "Current day for daily requests limit"
    t.integer "current_hits", default: 0, null: false, comment: "Hits of current day for daily requests limit", unsigned: true
    t.integer "ordering", default: 0, null: false
    t.integer "published", limit: 1, default: 0, null: false
    t.integer "checked_out", default: 0, null: false, unsigned: true
    t.datetime "checked_out_time", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "idxKey", unique: true
    t.index ["user_id"], name: "index_j33_jbackend_keys_on_user_id"
  end

  create_table "j33_jcp_approvals", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "item_id", null: false, unsigned: true
    t.integer "item_type", null: false, unsigned: true
    t.string "secret", limit: 128, null: false
    t.integer "status", limit: 1, null: false, unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["secret"], name: "idx_secret", unique: true
  end

  create_table "j33_jcp_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.string "alias", null: false
    t.integer "published", limit: 1, default: 0, null: false, unsigned: true
    t.integer "locked", limit: 1, default: 0, null: false, unsigned: true
    t.integer "parent_id", null: false, unsigned: true
    t.integer "num_polls", default: 0, null: false, unsigned: true
    t.integer "num_votes", default: 0, null: false, unsigned: true
    t.integer "nleft", null: false, unsigned: true
    t.integer "nright", null: false, unsigned: true
    t.integer "nlevel", default: 0, null: false, unsigned: true
    t.integer "norder", default: 0, null: false, unsigned: true
    t.string "language", limit: 6, default: "*", null: false
    t.integer "migrated", default: 0, null: false, unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_jcp_options", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "poll_id", null: false
    t.string "title", null: false
    t.string "type", limit: 10
    t.integer "votes", default: 0, null: false, unsigned: true
    t.integer "order", null: false, unsigned: true
    t.integer "published", limit: 1, default: 1, null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "idx_jcp_options_pollid"
  end

  create_table "j33_jcp_polls", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "asset_id", default: 0, null: false
    t.string "title", null: false
    t.string "alias", null: false
    t.text "description"
    t.text "end_message", size: :medium
    t.bigint "cat_id", default: 0, null: false
    t.integer "votes", default: 0, null: false, unsigned: true
    t.integer "voters", default: 0, null: false, unsigned: true
    t.datetime "created", null: false
    t.integer "created_by", null: false, unsigned: true
    t.string "created_by_alias"
    t.boolean "published"
    t.datetime "publish_up", null: false
    t.datetime "publish_down", null: false
    t.datetime "last_voted"
    t.integer "checked_out", default: 0, null: false, unsigned: true
    t.datetime "checked_out_time", null: false
    t.integer "featured", limit: 1, default: 0, null: false, unsigned: true
    t.datetime "close_date"
    t.datetime "results_up", null: false
    t.string "ip_address", limit: 39
    t.string "type", limit: 10, default: "radio", null: false
    t.integer "anywhere", limit: 1, default: 0
    t.integer "custom_answer", limit: 1, default: 0, null: false, unsigned: true
    t.string "chart_type", limit: 10, default: "global", null: false
    t.string "pallete", limit: 10, default: "default", null: false
    t.integer "anonymous", limit: 1, default: 0, null: false, unsigned: true
    t.integer "private", limit: 1, default: 0, null: false, unsigned: true
    t.string "secret", limit: 16
    t.string "answers_order", limit: 8, default: "order", null: false
    t.integer "min_answers", default: 1, null: false, unsigned: true
    t.integer "max_answers", default: 0, null: false, unsigned: true
    t.integer "modify_answers", limit: 1, default: 0, null: false, unsigned: true
    t.datetime "modified", null: false
    t.integer "modified_by", default: 0, null: false, unsigned: true
    t.string "language", limit: 6, default: "*", null: false
    t.integer "version", default: 0, null: false, unsigned: true
    t.string "attribs", limit: 5120
    t.integer "access", default: 0, null: false, unsigned: true
    t.integer "ordering", default: 0, null: false, unsigned: true
    t.text "metakey"
    t.text "metadesc"
    t.text "metadata"
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access"], name: "idx_jcp_polls_access"
    t.index ["asset_id"], name: "index_j33_jcp_polls_on_asset_id"
    t.index ["cat_id"], name: "idx_jcp_polls_catid"
    t.index ["checked_out"], name: "idx_jcp_polls_checkout"
    t.index ["created_by"], name: "idx_polls_created_by"
    t.index ["language"], name: "idx_jcp_polls_language"
    t.index ["published"], name: "idx_jcp_polls_published"
  end

  create_table "j33_jcp_resources", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "type", null: false
    t.text "value", null: false
    t.bigint "poll_id", null: false
    t.bigint "option_id"
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_j33_jcp_resources_on_option_id"
    t.index ["poll_id"], name: "index_j33_jcp_resources_on_poll_id"
  end

  create_table "j33_jcp_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "polls", default: 0, null: false, unsigned: true
    t.integer "votes", default: 0, null: false, unsigned: true
    t.datetime "last_poll", null: false
    t.datetime "last_voted", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_jcp_votes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "poll_id", null: false
    t.integer "voter_id", unsigned: true
    t.string "ip_address", limit: 39
    t.datetime "voted_on", null: false
    t.bigint "option_id", default: 0, null: false
    t.integer "column_id", default: 0, null: false, unsigned: true
    t.text "custom_answer"
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "idx_jcp_votes_optionid"
    t.index ["poll_id"], name: "FK_JCP_VOTES"
    t.index ["voter_id"], name: "idx_jcp_votes_voter_id"
  end

  create_table "j33_joodb_samples", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "myid", null: false
    t.string "title", limit: 100, null: false
    t.string "value", limit: 10
    t.string "usefull", default: "yes", null: false
    t.string "picture", limit: 100
    t.text "short_description"
    t.text "description", null: false
    t.string "wikipedia", limit: 254
    t.string "category", null: false
    t.timestamp "date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "state", limit: 1, default: 0, null: false, comment: "Table with joodb sample nosense data. Save to remove"
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["myid"], name: "index_j33_joodb_samples_on_myid", unique: true
    t.index ["state"], name: "state"
    t.index ["title"], name: "title"
  end

  create_table "j33_joodb_settings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 127, null: false
    t.text "value", null: false
    t.integer "jb_id"
    t.timestamp "changed", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jb_id"], name: "jb_id"
    t.index ["name"], name: "name"
  end

  create_table "j33_joodbs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 125, null: false
    t.string "table", null: false
    t.text "tpl_list", null: false
    t.text "tpl_single", null: false
    t.text "tpl_print"
    t.text "tpl_form"
    t.string "fid", null: false
    t.string "ftitle", null: false
    t.string "fcontent", null: false
    t.string "fabstract"
    t.string "fdate"
    t.string "fstate"
    t.text "params"
    t.boolean "published", default: true, null: false
    t.timestamp "created", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_languages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "lang_id", null: false, unsigned: true
    t.bigint "asset_id", default: 0, null: false
    t.string "lang_code", limit: 7, null: false
    t.string "title", limit: 50, null: false
    t.string "title_native", limit: 50, null: false
    t.string "sef", limit: 50, null: false
    t.string "image", limit: 50, null: false
    t.string "description", limit: 512, null: false
    t.text "metakey", size: :medium, null: false
    t.text "metadesc", size: :medium, null: false
    t.string "sitename", limit: 1024, null: false
    t.integer "published", default: 0, null: false
    t.integer "access", default: 0, null: false, unsigned: true
    t.integer "ordering", default: 0, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access"], name: "idx_access"
    t.index ["asset_id"], name: "index_j33_languages_on_asset_id"
    t.index ["lang_code"], name: "idx_langcode", unique: true
    t.index ["lang_id"], name: "idx_lang_id", unique: true
    t.index ["ordering"], name: "idx_ordering"
    t.index ["sef"], name: "idx_sef", unique: true
  end

  create_table "j33_menu_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "asset_id", default: 0, null: false
    t.string "menutype", limit: 24, null: false
    t.string "title", limit: 48, null: false
    t.string "description", null: false
    t.integer "client_id", default: 0, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_j33_menu_types_on_asset_id"
    t.index ["menutype"], name: "idx_menutype"
  end

  create_table "j33_menus", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "menutype", limit: 24, null: false, comment: "The type of menu this item belongs to. FK to #__menu_types.menutype"
    t.string "title", null: false, comment: "The display title of the menu item."
    t.string "alias", limit: 400, null: false, comment: "The SEF alias of the menu item."
    t.string "note", null: false
    t.string "path", limit: 1024, null: false, comment: "The computed path of the menu item based on the alias field."
    t.string "link", limit: 1024, null: false, comment: "The actual link the menu item refers to."
    t.string "type", limit: 16, null: false, comment: "The type of link: Component, URL, Alias, Separator"
    t.integer "published", limit: 1, default: 0, null: false, comment: "The published state of the menu link."
    t.integer "parent_id", default: 1, null: false, comment: "The parent menu item in the menu tree.", unsigned: true
    t.integer "level", default: 0, null: false, comment: "The relative level in the tree.", unsigned: true
    t.integer "component_id", default: 0, null: false, comment: "FK to jos_extensions.id", unsigned: true
    t.integer "checked_out", default: 0, null: false, comment: "FK to jos_users.id", unsigned: true
    t.datetime "checked_out_time", null: false, comment: "The time the menu item was checked out."
    t.boolean "browserNav", default: false, null: false, comment: "The click behavior of the link."
    t.integer "access", default: 0, null: false, comment: "The access level required to view the menu item.", unsigned: true
    t.string "img", null: false, comment: "The image of the menu item."
    t.bigint "template_style_id", default: 0, null: false
    t.text "params", size: :medium, null: false, comment: "JSON encoded data for the menu item."
    t.integer "lft", default: 0, null: false, comment: "Nested set lft."
    t.integer "rgt", default: 0, null: false, comment: "Nested set rgt."
    t.integer "home", limit: 1, default: 0, null: false, comment: "Indicates if this menu item is the home or default page.", unsigned: true
    t.string "language", limit: 7, null: false
    t.integer "client_id", limit: 1, default: 0, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alias"], name: "idx_alias", length: 100
    t.index ["client_id", "parent_id", "alias", "language"], name: "idx_client_id_parent_id_alias_language", unique: true, length: { alias: 100 }
    t.index ["component_id", "menutype", "published", "access"], name: "idx_componentid"
    t.index ["language"], name: "idx_language"
    t.index ["lft", "rgt"], name: "idx_left_right"
    t.index ["menutype"], name: "idx_menutype"
    t.index ["path"], name: "idx_path", length: 100
    t.index ["template_style_id"], name: "index_j33_menus_on_template_style_id"
  end

  create_table "j33_messages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "message_id", null: false, unsigned: true
    t.integer "user_id_from", default: 0, null: false, unsigned: true
    t.integer "user_id_to", default: 0, null: false, unsigned: true
    t.integer "folder_id", limit: 1, default: 0, null: false, unsigned: true
    t.datetime "date_time", null: false
    t.integer "state", limit: 1, default: 0, null: false
    t.integer "priority", limit: 1, default: 0, null: false, unsigned: true
    t.string "subject", null: false
    t.text "message", size: :medium, null: false
    t.string "token", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_j33_messages_on_message_id", unique: true
    t.index ["user_id_to", "state"], name: "useridto_state"
  end

  create_table "j33_messages_cfgs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", default: 0, null: false
    t.string "cfg_name", limit: 100, null: false
    t.string "cfg_value", null: false
    t.string "token", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "cfg_name"], name: "idx_user_var_name", unique: true
    t.index ["user_id"], name: "index_j33_messages_cfgs_on_user_id"
  end

  create_table "j33_mijosql_queries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.text "query", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_modules", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "asset_id", default: 0, null: false, comment: "FK to the jos_assets table."
    t.string "title", limit: 100, null: false
    t.string "note", null: false
    t.text "content"
    t.integer "ordering", default: 0, null: false
    t.string "position", limit: 50, null: false
    t.integer "checked_out", default: 0, null: false, unsigned: true
    t.datetime "checked_out_time", null: false
    t.datetime "publish_up", null: false
    t.datetime "publish_down", null: false
    t.integer "published", limit: 1, default: 0, null: false
    t.string "module", limit: 50
    t.integer "access", default: 0, null: false, unsigned: true
    t.integer "showtitle", limit: 1, default: 1, null: false, unsigned: true
    t.text "params", size: :medium, null: false
    t.integer "client_id", limit: 1, default: 0, null: false
    t.string "language", limit: 7, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_j33_modules_on_asset_id"
    t.index ["language"], name: "idx_language"
    t.index ["module", "published"], name: "newsfeeds"
    t.index ["published", "access"], name: "published"
  end

  create_table "j33_modules_menus", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "module_id", default: 0, null: false
    t.bigint "menu_id", default: 0, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_j33_modules_menus_on_menu_id"
    t.index ["module_id", "menu_id"], name: "index_j33_modules_menus_on_module_id_and_menu_id", unique: true
    t.index ["module_id"], name: "index_j33_modules_menus_on_module_id"
  end

  create_table "j33_newsfeeds", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "cat_id", default: 0, null: false
    t.string "name", limit: 100, null: false
    t.string "alias", limit: 400, null: false
    t.string "link", limit: 2048, null: false
    t.integer "published", limit: 1, default: 0, null: false
    t.integer "numarticles", default: 1, null: false, unsigned: true
    t.integer "cache_time", default: 3600, null: false, unsigned: true
    t.integer "checked_out", default: 0, null: false, unsigned: true
    t.datetime "checked_out_time", null: false
    t.integer "ordering", default: 0, null: false
    t.boolean "rtl", default: false, null: false
    t.integer "access", default: 0, null: false, unsigned: true
    t.string "language", limit: 7, null: false
    t.text "params", size: :medium, null: false
    t.datetime "created", null: false
    t.integer "created_by", default: 0, null: false, unsigned: true
    t.string "created_by_alias", null: false
    t.datetime "modified", null: false
    t.integer "modified_by", default: 0, null: false, unsigned: true
    t.text "metakey", size: :medium, null: false
    t.text "metadesc", size: :medium, null: false
    t.text "metadata", size: :medium, null: false
    t.string "xreference", limit: 50, null: false
    t.datetime "publish_up", null: false
    t.datetime "publish_down", null: false
    t.text "description", size: :medium, null: false
    t.integer "version", default: 1, null: false, unsigned: true
    t.integer "hits", default: 0, null: false, unsigned: true
    t.text "images", size: :medium, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access"], name: "idx_access"
    t.index ["cat_id"], name: "idx_catid"
    t.index ["checked_out"], name: "idx_checkout"
    t.index ["created_by"], name: "idx_createdby"
    t.index ["language"], name: "idx_language"
    t.index ["published"], name: "idx_state"
    t.index ["xreference"], name: "idx_xreference"
  end

  create_table "j33_overriders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "constant", null: false
    t.text "string", size: :medium, null: false
    t.string "file", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_piota_error_loggers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "ordering", null: false
    t.integer "state", limit: 1, null: false
    t.datetime "created_datetime", null: false
    t.integer "checked_out", null: false
    t.datetime "checked_out_time", null: false
    t.integer "created_by", null: false
    t.integer "modified_by", null: false
    t.string "error_prefix", null: false
    t.string "title", null: false
    t.string "message", null: false
    t.string "line", null: false
    t.string "linesource", null: false
    t.string "lineoffset", null: false
    t.string "sourcename", null: false
    t.string "ip_address", null: false
    t.string "appname", null: false
    t.string "piotaappversion", null: false
    t.string "piotaarch", null: false
    t.string "piotadevice", null: false
    t.string "piotauser", null: false
    t.string "useragent", null: false
    t.string "xtitaniumid", null: false
    t.string "device", null: false
    t.text "devnotes", null: false
    t.string "raw_error", null: false
    t.text "raw_header", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_postinstall_messages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "postinstall_message_id", null: false, unsigned: true
    t.bigint "extension_id", default: 700, null: false, comment: "FK to jos_extensions"
    t.string "title_key", null: false, comment: "Lang key for the title"
    t.string "description_key", null: false, comment: "Lang key for description"
    t.string "action_key", null: false
    t.string "language_extension", default: "com_postinstall", null: false, comment: "Extension holding lang keys"
    t.integer "language_client_id", limit: 1, default: 1, null: false
    t.string "type", limit: 10, default: "link", null: false, comment: "Message type - message, link, action"
    t.string "action_file", comment: "RAD URI to the PHP file containing action method"
    t.string "action", comment: "Action method name or URL"
    t.string "condition_file", comment: "RAD URI to file holding display condition method"
    t.string "condition_method", comment: "Display condition method, must return boolean"
    t.string "version_introduced", limit: 50, default: "3.2.0", null: false, comment: "Version when this message was introduced"
    t.boolean "enabled", default: true, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["extension_id"], name: "index_j33_postinstall_messages_on_extension_id"
    t.index ["postinstall_message_id"], name: "index_j33_postinstall_messages_on_postinstall_message_id", unique: true
  end

  create_table "j33_privacy_consents", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "state", default: 1, null: false
    t.datetime "created", null: false
    t.string "subject", null: false
    t.text "body", null: false
    t.integer "remind", limit: 1, default: 0, null: false
    t.string "token", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "j33_privacy_requests", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", limit: 100, null: false
    t.datetime "requested_at", null: false
    t.integer "status", limit: 1, default: 0, null: false
    t.string "request_type", limit: 25, null: false
    t.string "confirm_token", limit: 100, null: false
    t.datetime "confirm_token_created_at", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_redirect_links", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "old_url", limit: 2048, null: false
    t.string "new_url", limit: 2048
    t.string "referer", limit: 2048, null: false
    t.string "comment", null: false
    t.integer "hits", default: 0, null: false, unsigned: true
    t.integer "published", limit: 1, null: false
    t.datetime "created_date", null: false
    t.datetime "modified_date", null: false
    t.integer "header", limit: 2, default: 301, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modified_date"], name: "idx_link_modifed"
    t.index ["old_url"], name: "idx_old_url", length: 100
  end

  create_table "j33_schemas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "extension_id", null: false
    t.string "version_id", limit: 20, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["extension_id", "version_id"], name: "idx_primary", unique: true
    t.index ["extension_id"], name: "index_j33_schemas_on_extension_id"
  end

  create_table "j33_sessions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.binary "session_id", limit: 192, null: false
    t.integer "client_id", limit: 1, unsigned: true
    t.integer "guest", limit: 1, default: 1, unsigned: true
    t.integer "time", default: 0, null: false
    t.text "data", size: :long
    t.bigint "user_id", default: 0
    t.string "username", limit: 150
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id", "guest"], name: "client_id_guest"
    t.index ["session_id"], name: "index_j33_sessions_on_session_id", unique: true
    t.index ["time"], name: "time"
    t.index ["user_id"], name: "userid"
  end

  create_table "j33_tags", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "parent_id", default: 0, null: false, unsigned: true
    t.integer "lft", default: 0, null: false
    t.integer "rgt", default: 0, null: false
    t.integer "level", default: 0, null: false, unsigned: true
    t.string "path", limit: 400, null: false
    t.string "title", null: false
    t.string "alias", limit: 400, null: false
    t.string "note", null: false
    t.text "description", size: :long, null: false
    t.boolean "published", default: false, null: false
    t.integer "checked_out", default: 0, null: false, unsigned: true
    t.datetime "checked_out_time", null: false
    t.integer "access", default: 0, null: false, unsigned: true
    t.text "params", size: :medium, null: false
    t.string "metadesc", limit: 1024, null: false, comment: "The meta description for the page."
    t.string "metakey", limit: 1024, null: false, comment: "The meta keywords for the page."
    t.string "metadata", limit: 2048, null: false, comment: "JSON encoded metadata properties."
    t.integer "created_user_id", default: 0, null: false, unsigned: true
    t.datetime "created_time", null: false
    t.string "created_by_alias", null: false
    t.integer "modified_user_id", default: 0, null: false, unsigned: true
    t.datetime "modified_time", null: false
    t.text "images", size: :medium, null: false
    t.text "urls", size: :medium, null: false
    t.integer "hits", default: 0, null: false, unsigned: true
    t.string "language", limit: 7, null: false
    t.integer "version", default: 1, null: false, unsigned: true
    t.datetime "publish_up", null: false
    t.datetime "publish_down", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access"], name: "idx_access"
    t.index ["alias"], name: "idx_alias", length: 100
    t.index ["checked_out"], name: "idx_checkout"
    t.index ["language"], name: "idx_language"
    t.index ["lft", "rgt"], name: "idx_left_right"
    t.index ["path"], name: "idx_path", length: 100
    t.index ["published", "access"], name: "tag_idx"
  end

  create_table "j33_template_styles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "template", limit: 50, null: false
    t.integer "client_id", limit: 1, default: 0, null: false, unsigned: true
    t.string "home", limit: 7, default: "0", null: false
    t.string "title", null: false
    t.text "params", size: :medium, null: false
    t.integer "inheritable", limit: 1, default: 0, null: false
    t.string "parent", limit: 50
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id", "home"], name: "idx_client_id_home"
    t.index ["client_id"], name: "idx_client_id"
    t.index ["template"], name: "idx_template"
  end

  create_table "j33_ucm_bases", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "ucm_id", null: false, unsigned: true
    t.integer "ucm_item_id", null: false
    t.integer "ucm_type_id", null: false
    t.bigint "ucm_language_id", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ucm_id"], name: "idx_ucm_id", unique: true
    t.index ["ucm_item_id"], name: "idx_ucm_item_id"
    t.index ["ucm_language_id"], name: "idx_ucm_language_id"
    t.index ["ucm_type_id"], name: "idx_ucm_type_id"
  end

  create_table "j33_ucm_contents", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "core_content_id", null: false, unsigned: true
    t.string "core_type_alias", limit: 400, null: false, comment: "FK to the content types table"
    t.string "core_title", limit: 400, null: false
    t.string "core_alias", limit: 400, null: false
    t.text "core_body", size: :medium
    t.integer "core_state", limit: 1, default: 0, null: false
    t.string "core_checked_out_time", null: false
    t.integer "core_checked_out_user_id", default: 0, null: false, unsigned: true
    t.integer "core_access", default: 0, null: false, unsigned: true
    t.text "core_params"
    t.integer "core_featured", limit: 1, default: 0, null: false, unsigned: true
    t.string "core_metadata", limit: 2048, null: false, comment: "JSON encoded metadata properties."
    t.integer "core_created_user_id", default: 0, null: false, unsigned: true
    t.string "core_created_by_alias", null: false
    t.datetime "core_created_time", null: false
    t.integer "core_modified_user_id", default: 0, null: false, comment: "Most recent user that modified", unsigned: true
    t.datetime "core_modified_time", null: false
    t.string "core_language", limit: 7, null: false
    t.datetime "core_publish_up", null: false
    t.datetime "core_publish_down", null: false
    t.integer "core_content_item_id", default: 0, null: false, comment: "ID from the individual type table", unsigned: true
    t.bigint "asset_id", default: 0, null: false, comment: "FK to the #__assets table."
    t.text "core_images"
    t.text "core_urls"
    t.integer "core_hits", default: 0, null: false, unsigned: true
    t.integer "core_version", default: 1, null: false, unsigned: true
    t.integer "core_ordering", default: 0, null: false
    t.text "core_metakey"
    t.text "core_metadesc"
    t.integer "core_catid", default: 0, null: false, unsigned: true
    t.string "core_xreference", limit: 50, null: false, comment: "A reference to enable linkages to external data sets."
    t.integer "core_type_id", default: 0, null: false, unsigned: true
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_j33_ucm_contents_on_asset_id"
    t.index ["core_access"], name: "idx_access"
    t.index ["core_alias"], name: "idx_alias", length: 100
    t.index ["core_checked_out_user_id"], name: "idx_core_checked_out_user_id"
    t.index ["core_content_id"], name: "index_j33_ucm_contents_on_core_content_id", unique: true
    t.index ["core_created_time"], name: "idx_created_time"
    t.index ["core_created_user_id"], name: "idx_core_created_user_id"
    t.index ["core_language"], name: "idx_language"
    t.index ["core_modified_time"], name: "idx_modified_time"
    t.index ["core_modified_user_id"], name: "idx_core_modified_user_id"
    t.index ["core_state", "core_access"], name: "tag_idx"
    t.index ["core_state"], name: "index_j33_ucm_contents_on_core_state", unique: true
    t.index ["core_title"], name: "idx_title", length: 100
    t.index ["core_type_alias"], name: "idx_content_type", length: 100
    t.index ["core_type_id"], name: "idx_core_type_id"
  end

  create_table "j33_ucm_histories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "version_id", null: false, unsigned: true
    t.integer "ucm_item_id", null: false, unsigned: true
    t.integer "ucm_type_id", null: false, unsigned: true
    t.string "version_note", null: false, comment: "Optional version name"
    t.datetime "save_date", null: false
    t.integer "editor_user_id", default: 0, null: false, unsigned: true
    t.integer "character_count", default: 0, null: false, comment: "Number of characters in this version.", unsigned: true
    t.string "sha1_hash", limit: 50, null: false, comment: "SHA1 hash of the version_data column."
    t.text "version_data", size: :long, null: false, comment: "json-encoded string of version data"
    t.boolean "keep_forever", default: false, null: false, comment: "0=auto delete; 1=keep\t\tChange Change\tDrop Drop"
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["save_date"], name: "idx_save_date"
    t.index ["ucm_type_id", "ucm_item_id"], name: "idx_ucm_item_id"
    t.index ["version_id"], name: "idx_version_id", unique: true
  end

  create_table "j33_update_sites", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "update_site_id", null: false
    t.string "name", limit: 100
    t.string "type", limit: 20
    t.text "location", size: :medium, null: false
    t.integer "enabled", default: 0
    t.bigint "last_check_timestamp", default: 0
    t.string "extra_query", limit: 1000
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["update_site_id"], name: "index_j33_update_sites_on_update_site_id", unique: true
  end

  create_table "j33_update_sites_extensions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "update_site_id", default: 0, null: false
    t.bigint "extension_id", default: 0, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["extension_id"], name: "index_j33_update_sites_extensions_on_extension_id"
    t.index ["update_site_id", "extension_id"], name: "idx_primary", unique: true
    t.index ["update_site_id"], name: "index_j33_update_sites_extensions_on_update_site_id"
  end

  create_table "j33_updates", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "update_id", null: false
    t.bigint "update_site_id", default: 0
    t.bigint "extension_id", default: 0
    t.string "name", limit: 100
    t.text "description", size: :medium, null: false
    t.string "element", limit: 100
    t.string "type", limit: 20
    t.string "folder", limit: 20
    t.integer "client_id", limit: 1, default: 0
    t.string "version", limit: 32
    t.text "data", size: :medium, null: false
    t.text "detailsurl", size: :medium, null: false
    t.text "infourl", size: :medium, null: false
    t.string "extra_query", limit: 1000
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["extension_id"], name: "index_j33_updates_on_extension_id"
    t.index ["update_id"], name: "index_j33_updates_on_update_id", unique: true
    t.index ["update_site_id"], name: "index_j33_updates_on_update_site_id"
  end

  create_table "j33_user_keys", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "token", null: false
    t.string "series", limit: 191, null: false
    t.integer "invalid", limit: 1, null: false
    t.string "time", limit: 200, null: false
    t.string "uastring", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["series"], name: "series", unique: true
    t.index ["user_id"], name: "user_id"
  end

  create_table "j33_user_notes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", default: 0, null: false
    t.bigint "cat_id", default: 0, null: false
    t.string "subject", limit: 100, null: false
    t.text "body", size: :medium, null: false
    t.integer "state", limit: 1, default: 0, null: false
    t.integer "checked_out", default: 0, null: false, unsigned: true
    t.datetime "checked_out_time", null: false
    t.integer "created_user_id", default: 0, null: false, unsigned: true
    t.datetime "created_time", null: false
    t.integer "modified_user_id", null: false, unsigned: true
    t.datetime "modified_time", null: false
    t.datetime "review_time", null: false
    t.datetime "publish_up", null: false
    t.datetime "publish_down", null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "idx_category_id"
    t.index ["user_id"], name: "idx_user_id"
  end

  create_table "j33_user_profiles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "profile_key", limit: 100, null: false
    t.text "profile_value", null: false
    t.integer "ordering", default: 0, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "profile_key"], name: "idx_user_id_profile_key", unique: true
    t.index ["user_id"], name: "index_j33_user_profiles_on_user_id"
  end

  create_table "j33_user_usergroup_maps", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", default: 0, null: false, comment: "Foreign Key to jos_users.id"
    t.bigint "group_id", default: 0, null: false, comment: "Foreign Key to jos_usergroups.id"
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_j33_user_usergroup_maps_on_group_id"
    t.index ["user_id", "group_id"], name: "index_j33_user_usergroup_maps_on_user_id_and_group_id", unique: true
    t.index ["user_id"], name: "index_j33_user_usergroup_maps_on_user_id"
  end

  create_table "j33_usergroups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "parent_id", default: 0, null: false, comment: "Adjacency List Reference Id", unsigned: true
    t.integer "lft", default: 0, null: false, comment: "Nested set lft."
    t.integer "rgt", default: 0, null: false, comment: "Nested set rgt."
    t.string "title", limit: 100, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lft", "rgt"], name: "idx_usergroup_nested_set_lookup"
    t.index ["parent_id", "title"], name: "idx_usergroup_parent_title_lookup", unique: true
    t.index ["parent_id"], name: "idx_usergroup_adjacency_lookup"
    t.index ["title"], name: "idx_usergroup_title_lookup"
  end

  create_table "j33_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 400, null: false
    t.string "username", limit: 150, null: false
    t.string "email", limit: 100, null: false
    t.string "password", limit: 100, null: false
    t.boolean "block", default: false, null: false
    t.boolean "sendEmail", default: false
    t.datetime "registerDate", null: false
    t.datetime "lastvisitDate", null: false
    t.string "activation", limit: 100, null: false
    t.text "params", size: :medium, null: false
    t.datetime "lastResetTime", null: false, comment: "Date of last password reset"
    t.integer "resetCount", default: 0, null: false, comment: "Count of password resets since lastResetTime"
    t.string "otpKey", limit: 1000, null: false, comment: "Two factor authentication encrypted keys"
    t.string "otep", limit: 1000, null: false, comment: "One time emergency passwords"
    t.boolean "requireReset", default: false, null: false, comment: "Require user to reset password on next login"
    t.string "authProvider", limit: 100, null: false, comment: "Name of used authentication plugin"
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block"], name: "idx_block"
    t.index ["email"], name: "email"
    t.index ["name"], name: "idx_name", length: 100
    t.index ["username"], name: "idx_username", unique: true
  end

  create_table "j33_utf8_conversions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "converted", limit: 1, default: 0, null: false
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "j33_viewlevels", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.integer "ordering", default: 0, null: false
    t.string "rules", limit: 5120, null: false, comment: "JSON encoded access control."
    t.string "token", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "idx_assetgroup_title_lookup", unique: true
  end

  add_foreign_key "j33_action_logs", "j33_users", column: "user_id"
  add_foreign_key "j33_action_logs_users", "j33_users", column: "user_id"
  add_foreign_key "j33_ak_stats", "j33_ak_profiles", column: "profile_id"
  add_foreign_key "j33_banner_tracks", "j33_banners", column: "banner_id"
  add_foreign_key "j33_banners", "j33_categories", column: "cat_id"
  add_foreign_key "j33_categories", "j33_assets", column: "asset_id"
  add_foreign_key "j33_contact_details", "j33_categories", column: "cat_id"
  add_foreign_key "j33_contact_details", "j33_users", column: "user_id"
  add_foreign_key "j33_content_frontpages", "j33_contents", column: "content_id"
  add_foreign_key "j33_content_ratings", "j33_contents", column: "content_id"
  add_foreign_key "j33_content_statistics", "j33_users", column: "user_id"
  add_foreign_key "j33_contentitem_tag_maps", "j33_content_types", column: "type_id"
  add_foreign_key "j33_contentitem_tag_maps", "j33_tags", column: "tag_id"
  add_foreign_key "j33_contents", "j33_assets", column: "asset_id"
  add_foreign_key "j33_contents", "j33_categories", column: "cat_id"
  add_foreign_key "j33_corejoomla_messagequeues", "j33_messages", column: "message_id"
  add_foreign_key "j33_corejoomla_messages", "j33_assets", column: "asset_id"
  add_foreign_key "j33_corejoomla_rating_details", "j33_assets", column: "asset_id"
  add_foreign_key "j33_corejoomla_ratings", "j33_assets", column: "asset_id"
  add_foreign_key "j33_fields", "j33_assets", column: "asset_id"
  add_foreign_key "j33_fields_categories", "j33_categories", column: "category_id"
  add_foreign_key "j33_fields_categories", "j33_fields", column: "field_id"
  add_foreign_key "j33_fields_groups", "j33_assets", column: "asset_id"
  add_foreign_key "j33_fields_values", "j33_fields", column: "field_id"
  add_foreign_key "j33_fieldsattach_categories_values", "j33_categories", column: "cat_id"
  add_foreign_key "j33_fieldsattach_categories_values", "j33_fields", column: "fields_id"
  add_foreign_key "j33_fieldsattach_images", "j33_categories", column: "cat_id"
  add_foreign_key "j33_fieldsattach_images", "j33_fieldsattaches", column: "fieldsattach_id"
  add_foreign_key "j33_fieldsattach_values", "j33_fields", column: "fields_id"
  add_foreign_key "j33_finder_links_terms0s", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_terms0s", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_terms1s", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_terms1s", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_terms2s", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_terms2s", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_terms3s", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_terms3s", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_terms4s", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_terms4s", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_terms5s", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_terms5s", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_terms6s", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_terms6s", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_terms7s", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_terms7s", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_terms8s", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_terms8s", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_terms9s", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_terms9s", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_termsas", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_termsas", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_termsbs", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_termsbs", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_termscs", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_termscs", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_termsds", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_termsds", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_termses", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_termses", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_links_termsfs", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_links_termsfs", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_finder_taxonomy_maps", "j33_finder_links", column: "link_id"
  add_foreign_key "j33_finder_tokens_aggregates", "j33_finder_terms", column: "term_id"
  add_foreign_key "j33_jbackend_keys", "j33_users", column: "user_id"
  add_foreign_key "j33_jcp_options", "j33_jcp_polls", column: "poll_id"
  add_foreign_key "j33_jcp_polls", "j33_assets", column: "asset_id"
  add_foreign_key "j33_jcp_polls", "j33_categories", column: "cat_id"
  add_foreign_key "j33_jcp_resources", "j33_jcp_options", column: "option_id"
  add_foreign_key "j33_jcp_resources", "j33_jcp_polls", column: "poll_id"
  add_foreign_key "j33_jcp_votes", "j33_jcp_options", column: "option_id"
  add_foreign_key "j33_jcp_votes", "j33_jcp_polls", column: "poll_id"
  add_foreign_key "j33_languages", "j33_assets", column: "asset_id"
  add_foreign_key "j33_menu_types", "j33_assets", column: "asset_id"
  add_foreign_key "j33_menus", "j33_template_styles", column: "template_style_id"
  add_foreign_key "j33_messages_cfgs", "j33_users", column: "user_id"
  add_foreign_key "j33_modules", "j33_assets", column: "asset_id"
  add_foreign_key "j33_modules_menus", "j33_menus", column: "menu_id"
  add_foreign_key "j33_modules_menus", "j33_modules", column: "module_id"
  add_foreign_key "j33_newsfeeds", "j33_categories", column: "cat_id"
  add_foreign_key "j33_postinstall_messages", "j33_extensions", column: "extension_id"
  add_foreign_key "j33_privacy_consents", "j33_users", column: "user_id"
  add_foreign_key "j33_schemas", "j33_extensions", column: "extension_id"
  add_foreign_key "j33_sessions", "j33_users", column: "user_id"
  add_foreign_key "j33_ucm_contents", "j33_assets", column: "asset_id"
  add_foreign_key "j33_update_sites_extensions", "j33_extensions", column: "extension_id"
  add_foreign_key "j33_update_sites_extensions", "j33_update_sites", column: "update_site_id"
  add_foreign_key "j33_updates", "j33_extensions", column: "extension_id"
  add_foreign_key "j33_updates", "j33_update_sites", column: "update_site_id"
  add_foreign_key "j33_user_keys", "j33_users", column: "user_id"
  add_foreign_key "j33_user_notes", "j33_categories", column: "cat_id"
  add_foreign_key "j33_user_notes", "j33_users", column: "user_id"
  add_foreign_key "j33_user_profiles", "j33_users", column: "user_id"
  add_foreign_key "j33_user_usergroup_maps", "j33_usergroups", column: "group_id"
  add_foreign_key "j33_user_usergroup_maps", "j33_users", column: "user_id"
end
