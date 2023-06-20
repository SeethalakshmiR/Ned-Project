class CreateJ33Banners < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_banners do |t|
      t.integer :cid, null: false, default: 0
      t.integer :type, null: false, default: 0
      t.string :name, null: false, default: nil
      t.string :alias, null: false, default: nil, limit: 400
      t.integer :imptotal, null: false, default: 0
      t.integer :impmade, null: false, default: 0
      t.integer :clicks, null: false, default: 0
      t.string :clickurl, null: false, default: nil, limit: 200
      t.integer :state, null: false, default: 0, index: {name: 'idx_state'}, limit: 1
      t.references :cat, foreign_key: { to_table: :j33_categories }, null: false, default: 0, index: {name: 'idx_banner_catid'}
      t.text :description, limit: 16777215, null: false
      t.string :custombannercode, null: false, limit: 2048
      t.integer :sticky, limit: 1, null: false, default: 0, unsigned: true
      t.integer :ordering, null: false, default: 0
      t.text :metakey, limit: 16777215, null: false
      t.text :params, limit: 16777215, null: false
      t.integer :own_prefix, limit: 1, null: false, default: 0, index: {name: 'idx_own_prefix'}
      t.string :metakey_prefix, null: false, default: nil, limit: 400, index: {name: 'idx_metakey_prefix',length: 100}
      t.integer :purchase_type, limit: 1, null: false, default: -1
      t.integer :track_clicks, limit: 1, null: false, default: -1
      t.integer :track_impressions, limit: 1, null: false, default: -1
      t.integer :checked_out, null: false, default: 0, unsigned: true
      t.datetime :checked_out_time, null: false
      t.datetime :published_up, null: false
      t.datetime :published_down, null: false
      t.datetime :reset, null: false
      t.datetime :created, null: false
      t.string :language, null: false, default: nil, limit: 7, index: {name: 'idx_language'}
      t.integer :created_by, null: false, default: 0, unsigned: true
      t.string :created_by_alias, null: false, default: nil
      t.datetime :modified, null: false
      t.integer :modified_by, null: false, default: 0, unsigned: true
      t.integer :version, null: false, default: 1, unsigned: true
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
