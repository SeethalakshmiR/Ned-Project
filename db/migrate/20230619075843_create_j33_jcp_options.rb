class CreateJ33JcpOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_jcp_options do |t|
      t.references :poll, foreign_key: {to_table: :j33_jcp_polls}, null: false, index: { name: 'idx_jcp_options_pollid' }
      t.string :title, null: false, limit: 255
      t.string :type, limit: 10
      t.integer :votes, unsigned: true, default: 0, null: false
      t.integer :order, unsigned: true, null: false
      t.boolean :published, unsigned: true, default: 1, null: false 
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
