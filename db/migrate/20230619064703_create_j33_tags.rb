class CreateJ33Tags < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_tags do |t|
      t.integer :parent_id, null: false, default: 0, unsigned: true
      t.integer :lft, null: false, default: 0
      t.integer :rgt, null: false, default: 0
      t.integer :level, unsigned: true, null: false, default: 0
      t.string :path, null: false, default: nil, limit: 400, index: { name: 'idx_path', length: 100}
      t.string :title, null: false, limit: 255
      t.string :alias, null: false, default: nil, limit: 400, index: { name: 'idx_alias', length: 100}
      t.string :note, null: false, default: nil, limit: 255
      t.text :description, null: false, limit: 4294967295
      t.boolean :published, null: false, default: 0
      t.integer :checked_out, unsigned: true, null: false, default: 0, index: { name: 'idx_checkout'}
      t.datetime :checked_out_time, null: false
      t.integer :access, unsigned: true, null: false, default: 0, index: { name: 'idx_access'}
      t.text :params, null: false, limit: 16777215 
      t.string :metadesc, null: false, comment: 'The meta description for the page.', limit: 1024
      t.string :metakey, null: false, comment: 'The meta keywords for the page.', limit: 1024
      t.string :metadata, null: false, comment: 'JSON encoded metadata properties.', limit: 2048
      t.integer :created_user_id, unsigned: true, null: false, default: 0
      t.datetime :created_time, null: false
      t.string :created_by_alias, null: false, default: nil, limit: 255
      t.integer :modified_user_id, unsigned: true, null: false, default: 0
      t.datetime :modified_time, null: false 
      t.text :images, null: false, limit: 16777215 
      t.text :urls, null: false, limit: 16777215 
      t.integer :hits, null: false, default: 0, unsigned: true
      t.string :language, null: false, limit: 7, index: { name: 'idx_language'}
      t.integer :version,  unsigned: true, null: false, default: 1
      t.datetime :publish_up, null: false
      t.datetime :publish_down, null: false
      t.string :token, limit: 50, default: nil 

      t.timestamps
    end
    add_index(:j33_tags, [:published, :access], :name => 'tag_idx')
    add_index(:j33_tags, [:lft, :rgt], :name => 'idx_left_right')
  end
end
