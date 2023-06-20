class CreateJ33UserKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_user_keys do |t|
      t.references  :user,  foreign_key: { to_table: :j33_users }, null: false, index: {name: 'user_id'}
      t.string :token, null: false, limit: 255
      t.string :series, null: false, limit: 191, index: {unique: true, name: 'series'}
      t.integer :invalid, null: false, limit: 1
      t.string :time, null: false, limit: 200
      t.string :uastring, null: false, default: nil
      t.timestamps
    end
  end
end
