class CreateJ33Categories < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_categories do |t|
      t.references :asset, foreign_key: { to_table: :j33_assets}, null: false, default: 0,comment: 'FK to the jos_assets table.'
      t.integer :parent_id, null: false, unsigned: true, default: 0
      t.integer :lft, null: false, default: 0
      t.integer :rgt, null: false, default: 0
      t.integer :level, null: false, unsigned: true, default: 0
      t.string :path, null: false, limit: 400, index: { name: 'idx_path', length: 100}, default: nil
      t.string :extension, null: false, limit: 50, default: nil
      t.string :title, null: false, default: nil
      t.string :alias, null: false, limit: 400, index: { name: 'idx_alias', length: 100}, default: nil 
      t.string :note, null: false, default: nil
      t.text :description, limit: 16777215
      t.boolean :published, null: false, default: 0
      t.integer :checked_out, null: false, unsigned: true, index: { name: 'idx_checkout'}, default: 0
      t.datetime :checked_out_time, null: false
      t.integer :access, null: false, unsigned: true, default: 0, index: { name: 'idx_access'} 
      t.text :params
      t.string :metadesc, null: false, limit: 1024, default: nil, comment: 'The meta description for the page.'
      t.string :metakey, null: false, limit: 1024, default: nil, comment: 'The meta keywords for the page.'
      t.string :metadata, null: false, limit: 2048, default: nil, comment: 'JSON encoded metadata properties.'
      t.integer :created_user_id, unsigned: true, null: false, default: 0
      t.datetime :created_time, null: false
      t.integer :modified_user_id, unsigned: true, null: false, default: 0
      t.datetime :modified_time, null: false
      t.integer :hits, unsigned: true, null: false, default: 0
      t.string :language, null: false, limit: 7, index: { name: 'idx_language'}, default: nil
      t.integer :version, unsigned: true, null: false, default: 1
      t.string :token, null: false, limit: 50, default: nil
      t.timestamps
    end
    add_index :j33_categories, [:extension, :published, :access], name: 'cat_idx'
    add_index :j33_categories, [:lft, :rgt], name: 'idx_left_right'
  end
end
