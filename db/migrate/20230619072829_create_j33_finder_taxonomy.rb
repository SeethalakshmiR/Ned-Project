class CreateJ33FinderTaxonomy < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_finder_taxonomies do |t|
      t.integer :parent_id, unsigned: true, null: false, default: 0, index: { name: 'parent_id'}
      t.string :title, limit: 255, null: false
      t.integer :state, unsigned: true, null: false, default: 1, limit: 1, index: { name: 'state'}
      t.boolean :access, unsigned: true, null: false, default: 0, index: { name: 'access'}
      t.integer :ordering, unsigned: true, null: false, default: 0, limit: 1, index: { name: 'ordering'}
      t.string :token, limit: 50, default: nil 
      t.timestamps
    end
    add_index :j33_finder_taxonomies, [:parent_id, :state, :access], name: 'idx_parent_published'
  end
end
