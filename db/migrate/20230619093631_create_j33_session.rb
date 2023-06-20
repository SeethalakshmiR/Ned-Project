class CreateJ33Session < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_sessions do |t|
      t.binary :session_id, limit: 192, null: false, index: { unique: true }
      t.boolean :client_id, unsigned: true
      t.boolean :guest, unsigned: true, default: 1
      t.integer :time, null: false, default: 0, index: {name: 'time'}
      t.text :data, limit: 4294967295, charset: 'utf8mb4'
      t.references  :user,  foreign_key: { to_table: :j33_users }, default: 0, index: {name: 'userid'}
      t.string :username, limit: 150, charset: 'utf8mb4', default: nil 
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
    add_index :j33_sessions, [:client_id, :guest], name: 'client_id_guest'
  end
end
