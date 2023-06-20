class CreateJ33ContentStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_content_statistics do |t|
      t.string :component, null: false, index: {name: 'component'}, limit: 255
      t.integer :type, null: false, index: {name: 'type'}
      t.integer :value, null: false
      t.timestamp :date_event, null: false, default: -> { 'CURRENT_TIMESTAMP'}
      t.string :ip, null: false, limit: 31
      t.string :valuestring, null: false, limit: 255
      t.integer :reference_id, null: false, index: {name: 'reference_id'}
      t.references :user,  foreign_key: { to_table: :j33_users }, null: false, index: {name: 'user_id'}
      t.integer :location_id, null: false, index: {name: 'location_id'}
      t.string :country, null: false, limit: 15, index: {name: 'country'}
      t.string :state, null: false, limit: 255
      t.string :city, null: false, limit: 255
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
