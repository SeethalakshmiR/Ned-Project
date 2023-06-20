class CreateJ33FinderTaxonomyMap < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_finder_taxonomy_maps do |t|
      t.references :link, foreign_key: { to_table: :j33_finder_links}, null: false, index: { name: 'link_id'}
      t.integer :node_id, unsigned: true, null: false, index: { name: 'node_id'}
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
    add_index :j33_finder_taxonomy_maps, [:link_id, :node_id], unique: true
  end
end
