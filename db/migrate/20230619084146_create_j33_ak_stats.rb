class CreateJ33AkStats < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_ak_stats do |t|
      t.string :description, null: false, limit: 255
      t.text :comment, limit: 4294967295
      t.timestamp :backupstart, default: nil 
      t.timestamp :backupend, default: nil  
      t.string :status, null: false, default: 'run'
      t.string :origin, null: false, default: 'backend', limit: 30 
      t.string :type, null: false, default: 'full', limit: 30
      t.references :profile, foreign_key: { to_table: :j33_ak_profiles}, null: false, default: '1'
      t.text :archivename, limit: 4294967295
      t.text :absolute_path, limit: 4294967295
      t.integer :multipart, null: false, default: 0 
      t.string :tag, limit: 255 
      t.string :backupid, limit: 255  
      t.boolean :filesexist, null: false, default: 1
      t.string :remote_filename, limit: 1000
      t.bigint :total_size, null: false, default: 0
      t.integer :frozen, limit: 1, default: 0
      t.integer :instep, limit: 1, default: 0
      t.string :token, limit: 50, default: nil

      t.timestamps
    end
    add_index :j33_ak_stats, [:filesexist, :status], name: 'idx_fullstatus'
    add_index :j33_ak_stats, [:status, :origin], name: 'idx_stale'
  end
end
