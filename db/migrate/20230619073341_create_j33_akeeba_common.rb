class CreateJ33AkeebaCommon < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_akeeba_commons do |t|
      t.string :key, null: false, limit: 190, index: {unique: 'true',name: 'idx_key'} 
      t.text :value, limit: 4294967295, null: false
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
