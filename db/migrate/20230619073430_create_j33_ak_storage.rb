class CreateJ33AkStorage < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_ak_storages do |t|
      t.string :tag, null: false, limit: 255, index: {unique: 'true',name: 'idx_tag', length: 100}
      t.timestamp :lastupdate, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.text :data, limit: 4294967295, default: nil
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
