class CreateJ33Modules < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_modules do |t|
      t.references :asset, foreign_key: { to_table: :j33_assets}, null: false, default: 0, comment: 'FK to the jos_assets table.'
      t.string :title, limit: 100, null: false, default: nil
      t.string :note, limit: 255, null: false, default: nil
      t.text :content
      t.integer :ordering, null: false, default: 0
      t.string :position, limit: 50, null: false, default: nil
      t.integer :checked_out, unsigned: true, null: false, default: 0
      t.datetime :checked_out_time, null: false
      t.datetime :publish_up, null: false
      t.datetime :publish_down, null: false
      t.integer :published, limit: 1, null: false, default: false
      t.string :module, limit: 50
      t.integer :access, unsigned: true, null: false, default: 0
      t.boolean :showtitle, unsigned: true, null: false, default: true
      t.text :params, limit: 16777215,  null: false
      t.integer :client_id, limit: 1, null: false, default: 0
      t.string :language, limit: 7, null: false, index: { name: 'idx_language'} 
      t.string :token, limit: 50, default: nil
      t.timestamps
      end
    add_index :j33_modules, [:published, :access], name: 'published'
    add_index :j33_modules, [:module, :published], name: 'newsfeeds'
    end
end
