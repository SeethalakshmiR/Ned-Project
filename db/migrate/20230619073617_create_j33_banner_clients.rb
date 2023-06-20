class CreateJ33BannerClients < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_banner_clients do |t|
      t.string :name, limit: 255, default: nil, null: false
      t.string :contact, limit: 255, default: nil, null: false
      t.string :email, limit: 255, default: nil, null: false
      t.text :extrainfo, limit: 16777215, null: false
      t.integer :state, default: 0 , null: false, limit: 1
      t.integer :checked_out, unsigned: true, default: 0, null: false
      t.datetime :checked_out_time, null: false
      t.text :metakey, limit: 16777215, null: false
      t.integer :own_prefix, default: 0, null: false, index:{name: 'idx_own_prefix'}, limit: 1
      t.string :metakey_prefix, limit: 255, default: nil, null: false, index:{name: 'idx_metakey_prefix',length: 100 }
      t.integer :purchase_type, default: -1, null: false, limit: 1
      t.integer :track_clicks, default: -1, null: false, limit: 1
      t.integer :track_impressions, default: -1, null: false, limit: 1
      t.string :token, limit: 50 ,default: nil
      t.timestamps
    end
  end
end
