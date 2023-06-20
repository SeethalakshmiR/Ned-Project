class CreateJ33ActionLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_action_logs do |t|
      t.string :message_language_key, null: false, default: nil
      t.text :message, null: false
      t.datetime :log_date, null: false
      t.string :extension, limit: 50, null: false, default: nil
      t.references :user, foreign_key: { to_table: :j33_users }, null: false, index: {name: 'idx_user_id'}, default: 0
      t.integer :item_id, null: false, default: 0
      t.string :ip_address, null: false, limit: 40, default: '0.0.0.0'
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
      add_index(:j33_action_logs, [:user_id, :log_date], :name => 'idx_user_id_logdate')
      add_index(:j33_action_logs, [:user_id, :extension], :name => 'idx_user_id_extension')
      add_index(:j33_action_logs, [:extension, :item_id], :name => 'idx_extension_item_id')
  end
end
