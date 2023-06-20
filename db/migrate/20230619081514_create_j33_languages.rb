class CreateJ33Languages < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_languages do |t|
      t.integer :lang_id, unsigned: true, null: false, index: {name: 'idx_lang_id', unique: true} 
      t.references :asset, foreign_key: { to_table: :j33_assets}, null: false, default: 0
      t.string :lang_code, null: false,limit: 7, index: {unique: 'true', name: 'idx_langcode'}
      t.string :title, null: false, limit: 50
      t.string :title_native, null: false, limit: 50
      t.string :sef, null: false, limit: 50, index: {unique: 'true', name: 'idx_sef'}
      t.string :image, null: false, limit: 50
      t.string :description, null: false, limit: 512
      t.text :metakey, null: false, limit: 16777215
      t.text :metadesc, null: false, limit:16777215
      t.string :sitename, null: false, default: nil, limit: 1024
      t.integer :published, null: false, default: 0
      t.integer :access, unsigned: true, null: false, default: 0, index: {name: 'idx_access'} 
      t.integer :ordering, null: false, default: 0, index: {name: 'idx_ordering'}
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
