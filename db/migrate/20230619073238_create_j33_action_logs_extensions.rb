class CreateJ33ActionLogsExtensions < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_action_logs_extensions do |t|
      t.string :extension, null: false, limit: 255, default: nil
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
