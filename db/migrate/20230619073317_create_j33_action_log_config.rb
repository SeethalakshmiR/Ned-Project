class CreateJ33ActionLogConfig < ActiveRecord::Migration[7.0]
  def change
    create_table :j33_action_log_configs do |t|
      t.string :type_title, null: false, limit: 255, default: nil
      t.string :type_alias, null: false, limit: 255, default: nil
      t.string :id_holder, default: nil, limit: 255
      t.string :title_holder, default: nil, limit: 255
      t.string :table_name, default: nil, limit: 255
      t.string :text_prefix, default: nil, limit: 255
      t.string :token, limit: 50, default: nil
      t.timestamps
    end
  end
end
