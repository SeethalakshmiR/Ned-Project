class CreateJ33JcpUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_jcp_users do |t|
      t.integer :polls, unsigned: true, null: false, default: 0
      t.integer :votes, unsigned: true, null: false, default: 0
      t.datetime :last_poll, null: false
      t.datetime :last_voted, null: false
      t.string :token, limit: 50, default: nil
      
      t.timestamps
    end
  end
end
