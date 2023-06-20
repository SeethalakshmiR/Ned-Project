class CreateJ33UcmContent < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_ucm_contents do |t|
      t.integer :core_content_id, null: false, unsigned: true, index: {unique: true}
      # t.references :core_type_alias, foreign_key: { to_table: :j33_content_types }, null: false, default: nil, comment: 'FK to the content types table', limit: 255, index: {unique: true, length: 100}
      t.string :core_type_alias, null: false, default: nil, comment: 'FK to the content types table', limit: 400, index: { name: 'idx_content_type', length: 100}
      t.string :core_title, null: false, default: nil, limit: 400, index: { name: 'idx_title', length: 100}
      t.string :core_alias, null: false, default: nil, limit: 400, index: { name: 'idx_alias', length: 100 }
      t.text :core_body, limit: 16777215 
      t.integer :core_state, null: false, default: 0, limit: 1, index: {unique: true}
      t.string :core_checked_out_time, null: false, limit: 255
      t.integer :core_checked_out_user_id, unsigned: true, null: false, default: 0, index: { name: 'idx_core_checked_out_user_id'}
      t.integer :core_access, unsigned: true, null: false, default: 0, index: { name: 'idx_access'}
      t.text :core_params
      t.integer :core_featured, unsigned: true, null: false, default: 0, limit: 1
      t.string :core_metadata, null: false, default: nil, comment: 'JSON encoded metadata properties.', limit: 2048
      t.integer :core_created_user_id, unsigned: true, null: false, default: 0, index: { name: 'idx_core_created_user_id'}
      t.string :core_created_by_alias, null: false, default: nil, limit: 255
      t.datetime :core_created_time, null: false, index: { name: 'idx_created_time'}
      t.integer :core_modified_user_id, unsigned: true, null: false, default: 0, comment: 'Most recent user that modified', index: { name: 'idx_core_modified_user_id'}
      t.datetime :core_modified_time, null: false, index: { name: 'idx_modified_time'}
      t.string :core_language, null: false, default: nil, limit: 7, index: { name: 'idx_language'}
      t.datetime :core_publish_up, null: false
      t.datetime :core_publish_down, null: false 
      t.integer :core_content_item_id, unsigned: true, null: false, default: 0, comment: 'ID from the individual type table'
      t.references :asset, foreign_key: { to_table: :j33_assets }, null: false, default: 0, comment: 'FK to the #__assets table.'
      t.text :core_images
      t.text :core_urls
      t.integer :core_hits, unsigned: true, null: false, default: 0
      t.integer :core_version, unsigned: true, null: false, default: 1
      t.integer :core_ordering, null: false, default: 0
      t.text :core_metakey
      t.text :core_metadesc
      t.integer :core_catid, unsigned: true, null: false, default: 0
      t.string :core_xreference, null: false, default: nil, comment: 'A reference to enable linkages to external data sets.', limit: 50
      t.integer :core_type_id, unsigned: true, null: false, default: 0, index: { name: 'idx_core_type_id'}
      t.string :token, limit: 50, default: nil 
      t.timestamps
    end
    add_index(:j33_ucm_contents, [:core_state, :core_access], :name => 'tag_idx')
  end
end
