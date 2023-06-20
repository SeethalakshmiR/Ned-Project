class CreateJ33JbackendKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_jbackend_keys do |t|
      t.string :key, null: false, index: { unique: true, name: 'idxKey'}
      t.references  :user,  foreign_key: { to_table: :j33_users }, null: false, default: 0, comment: 'Existing user id'
      t.integer :daily_requests, null: false, default: 0, comment: 'Max number of daily requests (0=Unlimited)'
      t.datetime :expiration_date, null: false
      t.string :comment
      t.integer :hits, unsigned: true, null: false, default: 0
      t.datetime :last_visit, null: false
      t.datetime :current_day, null: false, comment: 'Current day for daily requests limit'
      t.integer :current_hits, unsigned: true, null: false, default: 0, comment: 'Hits of current day for daily requests limit'
      t.integer :ordering, null: false, default: 0
      t.integer :published, null: false, default: 0, limit: 1
      t.integer :checked_out, unsigned: true, null: false, default: 0
      t.datetime :checked_out_time, null: false
      t.string :token, limit: 50, default: nil 
      t.timestamps
    end
  end
end
