class CreateJ33JoodbSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_joodb_settings do |t|
      t.string      :name, null: false, index: { name: 'name'}, limit: 127
      t.text        :value, null: false
      t.integer     :jb_id, default: nil, index: { name: 'jb_id'}
      t.timestamp   :changed, default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string :token, limit: 50, default: nil 
      t.timestamps
    end
  end
end
