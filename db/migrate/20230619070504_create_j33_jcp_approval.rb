class CreateJ33JcpApproval < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_jcp_approvals do |t|
      t.integer :item_id, unsigned: true, null: false
      t.integer :item_type, unsigned: true, null: false
      t.string :secret, limit: 128, null: false, index: {name: 'idx_secret', unique: true} 
      t.boolean :status, unsigned: true, null: false
      t.timestamps
    end
  end
end
