class CreateJ33UcmHistory < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_ucm_histories do |t|
      t.integer :version_id, unsigned: true, null: false, index: {name: 'idx_version_id', unique: true} 
      t.integer :ucm_item_id, unsigned: true, null: false
      t.integer :ucm_type_id, unsigned: true, null: false
      t.string :version_note, limit: 255, default: nil, null: false, comment: 'Optional version name'
      t.datetime :save_date, null: false, index: {name: 'idx_save_date'} 
      t.integer :editor_user_id, unsigned: true, default: 0, null: false
      t.integer :character_count, unsigned: true, default: 0, null: false, comment: 'Number of characters in this version.'
      t.string :sha1_hash, limit: 50, default: nil, null: false, comment: 'SHA1 hash of the version_data column.'
      t.text :version_data, null: false, limit: 4294967295, comment: 'json-encoded string of version data'
      t.boolean :keep_forever, default: 0, null: false, comment: '0=auto delete; 1=keep		Change Change	Drop Drop'
      t.string :token, limit: 50, default: nil

      t.timestamps
    end
    add_index :j33_ucm_histories, [:ucm_type_id, :ucm_item_id], name: 'idx_ucm_item_id'
  end
end
