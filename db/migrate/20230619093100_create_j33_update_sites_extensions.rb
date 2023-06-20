class CreateJ33UpdateSitesExtensions < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_update_sites_extensions do |t|
      t.references :update_site, foreign_key: { to_table: :j33_update_sites}, null: false, default: 0
      t.references :extension, foreign_key: { to_table: :j33_extensions}, null: false, default: 0
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
    add_index(:j33_update_sites_extensions, [:update_site_id, :extension_id], unique: true, name: 'idx_primary')
  end
end
