class CreateJ33UpdateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_update_sites do |t|
      t.integer :update_site_id, null: false, index: { unique: true }
      t.string :name, default: nil, limit: 100
      t.string :type, default: nil, limit: 20
      t.text :location, null: false, limit: 16777215 
      t.integer :enabled, default: 0 
      t.bigint :last_check_timestamp, default: 0
      t.string :extra_query, default: nil, limit: 1000
      t.string :token, limit: 50, default: nil

      t.timestamps
    end
  end
end
