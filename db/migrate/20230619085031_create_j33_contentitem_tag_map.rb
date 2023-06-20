class CreateJ33ContentitemTagMap < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_contentitem_tag_maps do |t|
      t.string :type_alias, null: false, limit: 255, default: nil
      t.integer :core_content_id, null: false, unsigned: true, comment: 'PK from the core content table', index: { name: 'idx_core_content_id'}
      t.integer :content_item_id, null: false, comment: 'PK from the content type table'
      t.references :tag, foreign_key: { to_table: :j33_tags}, null: false, comment: 'PK from the tag table'
      t.timestamp :tag_date, null: false, default: -> { 'CURRENT_TIMESTAMP' }, comment: 'Date of most recent save for this tag-item'      
      t.references :type, foreign_key: { to_table: :j33_content_types}, null: false, limit: 3, comment: 'PK from the content_type table'
      t.string :token, limit: 50, default: nil

      t.timestamps
    end
    add_index :j33_contentitem_tag_maps, [:type_id, :content_item_id, :tag_id], unique: true, name: 'uc_ItemnameTagid'
    add_index :j33_contentitem_tag_maps, [:tag_id, :type_id], name: 'idx_tag_type'
    add_index :j33_contentitem_tag_maps, [:tag_date, :tag_id], name: 'idx_date_id'
  end
end