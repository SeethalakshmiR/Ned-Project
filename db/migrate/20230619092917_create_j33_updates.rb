class CreateJ33Updates < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_updates do |t|
      t.integer :update_id, null: false, index: { unique: true }
      t.references :update_site, foreign_key: { to_table: :j33_update_sites }, default: 0
      t.references :extension, foreign_key: { to_table: :j33_extensions }, default: 0
      t.string :name, default: nil, limit: 100
      t.text :description, null: false, limit: 16777215
      t.string :element, default: nil, limit: 100
      t.string :type, default: nil, limit: 20
      t.string :folder, default: nil, limit: 20
      t.integer :client_id, default: 0, limit: 1
      t.string :version, default: nil, limit: 32
      t.text :data, null: false, limit: 16777215
      t.text :detailsurl, null: false, limit: 16777215
      t.text :infourl, null: false, limit: 16777215
      t.string :extra_query, default: nil, limit: 1000
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
