class CreateJ33BannerTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_banner_tracks do |t|
      t.datetime :track_date, null: false, index: {name: 'idx_track_date'}
      t.integer :track_type, unsigned: true, null: false, index: {name: 'idx_track_type'}
      t.references  :banner, foreign_key: { to_table: :j33_banners }, null: false, index: {name: 'idx_banner_id'}
      t.integer :count, unsigned: true, default: 0, null: false
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
    add_index :j33_banner_tracks, [:track_date, :track_type, :banner_id], name: 'idx_PRIMARY', unique: true
  end
end