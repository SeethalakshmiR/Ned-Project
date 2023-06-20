class CreateJ33ActionLogsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_action_logs_users do |t|
       t.references :user, foreign_key: { to_table: :j33_users }, null: false, index: {unique: true}
       t.boolean :notify, null: false, unsigned: true, index: {name: 'idx_notify'}
       t.text :extensions, null: false
       t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
