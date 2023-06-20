class CreateJ33MessagesCfg < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_messages_cfgs do |t|
t.references  :user,  foreign_key: { to_table: :j33_users }, null: false, default: 0
t.string :cfg_name, null: false, limit: 100, default: nil
t.string :cfg_value, null: false, limit: 255, default: nil
t.string :token, null: false, limit: 100, default: nil
t.timestamps
end
add_index :j33_messages_cfgs, [:user_id, :cfg_name], unique: true, name: 'idx_user_var_name'
    
  end
end
