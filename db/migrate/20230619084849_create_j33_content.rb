class CreateJ33Content < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_contents do |t|
      t.references :asset, foreign_key: { to_table: :j33_assets }, null: false, default: 1, comment: 'FK to the jos_assets table.'
      t.string :title, null: false, limit: 255, default: nil
      t.string :alias, null: false, limit: 400, default: nil, index: { name: 'idx_alias', length: 191 }
      t.text :introtext, null: false, limit: 4294967295
      # t.text :fulltext, null: false, limit: 4294967295
      # t.integer :state, null: false, default: 0, limit:1, index: { name: 'idx_state' }
      t.references :cat, foreign_key: {to_table: :j33_categories}, null: false, default: 1, index: { name: 'idx_catid' }
      # t.datetime :created, null: false
      t.references :created_by, foreign_key: { to_table: :j33_users }, null: false, default: 1, index: {name: 'idx_createdby'}
      # t.integer :created_by, null: false, default: 0, unsigned: true, index: { name: 'idx_createdby' }
      # t.string :created_by_alias, null: false, limit: 255, default: nil
      # t.datetime :modified, null: false
      # t.integer :modified_by, null: false, default: 0, unsigned: true
      # t.integer :checked_out, null: false, default: 0, unsigned: true, index: { name: 'idx_checkout' }
      # t.datetime :checked_out_time, null: false
      # t.datetime :publish_up, null: false
      # t.datetime :publish_down, null: false
      # t.text :images, null: false, limit: 16777215
      # t.text :urls, null: false, limit: 16777215
      # t.string :attribs, null: false, limit: 5120
      # t.integer :version, null: false, default: 1 ,unsigned: true
      # t.integer :ordering, null: false, default: 0
      # t.text :metakey, null: false, limit: 16777215
      # t.text :metadesc, null: false, limit: 16777215
      # t.integer :access, null: false, default: 0 ,unsigned: true, index: { name: 'idx_access' }
      # t.integer :hits, null: false, default: 0 ,unsigned: true
      # t.text :metadata, null: false ,limit: 16777215
      # t.boolean :featured, null: false, default: 0, unsigned: true, comment: 'Set if article is featured.'  
      # t.string :language, null: false, limit: 7, comment: 'The language code for the article.', index: { name: 'idx_language' }
      # t.string :xreference, null: false, limit: 50, default: nil, index: { name: 'idx_xreference' }
      # t.string :note, null: false, limit: 255, default: nil
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
    # add_index :j33_contents, [:featured, :cat_id], name: 'idx_featured_catid'
  end
end
