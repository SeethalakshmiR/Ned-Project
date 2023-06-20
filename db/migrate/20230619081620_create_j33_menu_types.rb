class CreateJ33MenuTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_menu_types do |t|
      t.references :asset, foreign_key: { to_table: :j33_assets}, null: false, default: 0
      #t.bigint :asset, unsigned: true, foreign_key: { to_table: :j33_assets}, null: false, default: 0
      t.string :menutype, limit: 24, null: false, index: { name: 'idx_menutype'} 
      t.string :title, limit: 48, null: false
      t.string :description, limit: 255, null: false, default: nil
      t.integer :client_id, null: false, default: 0
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
