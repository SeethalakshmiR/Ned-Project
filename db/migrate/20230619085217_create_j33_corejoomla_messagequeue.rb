class CreateJ33CorejoomlaMessagequeue < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_corejoomla_messagequeues do |t|
      t.boolean :status, null: false, default: 0, unsigned: true
      t.string :to_addr, null: false, limit: 128
      t.string :cc_addr, default: nil, limit: 128
      t.string :bcc_addr, default: nil, limit: 128
      t.integer :html, null: false, default: 1, limit: 1
      t.references :message, foreign_key: { to_table: :j33_messages}, null: false
      t.text :params, limit: 16777215
      t.datetime :created, null: false
      t.datetime :processed, null: false
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end